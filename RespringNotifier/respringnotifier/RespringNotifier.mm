#import <Preferences/Preferences.h>

@interface RespringNotifierListController: PSListController {
}
@end

@implementation RespringNotifierListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"RespringNotifier" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
