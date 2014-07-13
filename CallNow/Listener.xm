//This line tells theos we want to include ('import') the Activator library in our project so we can use its features.
#import "libactivator.h"

//Here, we're making an interface which conforms to LAListener
@interface CallNow : NSObject<LAListener> 
{} 
@end

//Now that we've made the header, we write the implementation for our CallNow class.
@implementation CallNow

//We're accessing the method that runs when Activator receives the event. (i.e. the user uses their activator gesture)
-(void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {

    //Log that the gesture was inputted
    NSLog(@"Listener Accepted");
    
    //In this line, we're telling the program where our settings values exist at in the filesystem. We will use this, for example, to see if the user has our tweak enabled or not.
    NSString *settingsPath = @"/var/mobile/Library/Preferences/com.phillipt.callnow~prefs.plist";
    
    //Now, we're creating a modifiable dictionary called 'prefs' which contains the settings values from the line above.
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
    
    //Make a new string called 'number' which contains the value of the 'text' key from the prefs dictionary in the line above.
    NSString *number = [prefs objectForKey:@"text"];

    //In this line we're saying:
    //IF the number string (which we defined above) is empty, or:
    //IF the number string (which we defined above) doesn't exist:
    if ([number isEqualToString:@""] || number == nil) {
        
        //THEN, create a UIAlertView called 'alert1' which, erm, *alerts* the user that the number in Settings is not a valid number.
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Error"
        message:[NSString stringWithFormat:@"Not a valid number"]
        delegate:nil
        cancelButtonTitle:@"Ok"
        otherButtonTitles:nil];
        
        //Show the alert we made in the above line
        [alert1 show];
        
        //And release it so we don't use up any unnecessary memory.
        [alert1 release];
    
    }
    
    //OTHERWISE
    else {

        //Using the openURL method from the UIApplication framework, open a URL with the contents of the 'number' string and specify that it's a phone number.
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]]];

    }
}

//When loading, create a new Activator listener which listens for our tweak.
+(void)load {
	NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.phillipt.callnow"];
	[p release];
}

//Let the compiler know we're done with the implementation of this class.
@end
