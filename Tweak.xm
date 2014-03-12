%hook SBLockScreenView

- (void)setCustomSlideToUnlockText:(id)unlockText {
    
    NSString *settingsPath = @"/var/mobile/Library/Preferences/com.phillipt.unlockchanger~prefs.plist";
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
 
    NSString *text = [prefs objectForKey:@"text"];
    NSString *enabled = [prefs objectForKey:@"enabled"];
        
    if([text isEqualToString:@""] || text == nil || [enabled boolValue] == 0) {
        
        %orig(unlockText);
        
    }
    
    else if ([enabled boolValue] == 1) {
        
        unlockText = text;
        %orig(unlockText);
        
    }

}

%end