#import <Preferences/Preferences.h>

@interface CallNowListController: PSListController {
}
@end

@implementation CallNowListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"CallNow" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
