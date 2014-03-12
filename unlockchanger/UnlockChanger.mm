#import <Preferences/Preferences.h>

@interface UnlockChangerListController: PSListController {
}
@end

@implementation UnlockChangerListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"UnlockChanger" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
