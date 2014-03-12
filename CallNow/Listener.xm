#import "libactivator.h"
@interface CallNow : NSObject<LAListener> 
{} 
@end

@implementation CallNow

-(void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {

    NSLog(@"Listener Accepted");
    
    NSString *settingsPath = @"/var/mobile/Library/Preferences/com.phillipt.callnow~prefs.plist";
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
    
    NSString *number = [prefs objectForKey:@"text"];

    if ( [number isEqualToString:@""] || number == nil) {
    
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Error"
        message:[NSString stringWithFormat:@"Not a valid number"]
        delegate:nil
        cancelButtonTitle:@"Ok"
        otherButtonTitles:nil];
        
        [alert1 show];
        [alert1 release];
    
    }
    
    else {

        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]]];

    }
}

+(void)load {
	NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.phillipt.callnow"];
	[p release];
}
@end
