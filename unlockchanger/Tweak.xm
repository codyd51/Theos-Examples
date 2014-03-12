//Here, we're telling theos we want to 'hook' the header SBLockScreenView. 'Hooking' basically means we want to access this header and modify the methods inside it.
%hook SBLockScreenView

//Now that theos knows we want to hook the header SBLockScreenView, we can directly 'hijack' SBLockScreenView's methods and modify them to run out own code instead of their original code.

//In this example, we are hijacking the method - (void)setCustomSlideToUnlockText and making it run our own code. This method takes an argument, (id)arg1, which we are calling unlockText.
- (void)setCustomSlideToUnlockText:(id)unlockText {
    
    //In this line, we're telling the program where our settings values exist at in the filesystem. We will use this, for example, to see if the user has our tweak enabled or not.
    NSString *settingsPath = @"/var/mobile/Library/Preferences/com.phillipt.unlockchanger~prefs.plist";
    
    //Now, we're creating a modifiable dictionary called 'prefs' which contains the settings values from the line above.
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
 
    //Make a new string called 'text' which contains the value of the 'text' key from the prefs dictionary in the line above.
    NSString *text = [prefs objectForKey:@"text"];
    
    //Make a boolean which holds the value of the settings key called "enabled", much like the line above.
    BOOL enabled = [prefs objectForKey:@"enabled"];
        
    
    //In this line, we're saying:
    //IF the text string is empty, or:
    //IF the text string is nonexistent, or
    //IF the 'enabled' key is equal to FALSE or NO (i.e. if the user turned off the tweak),
    if([text isEqualToString:@""] || text == nil || ![enabled]) {
        
        
        //THEN, return the method without modifying it at all.
        %orig(unlockText);
        
    }
    
    
    //OTHERWISE
    //IF the 'enabled' key is equal to 'true' or 'on',
    else if ([enabled]) {
        
        
        //Set the argument unlockText (remember that?) to whatever is in the 'text' string.
        unlockText = text;
        
        //Then, return the original method. But remember, the argument now contains our custom information.
        %orig(unlockText);
        
    }

}


//This lets theos know that we're done hooking this header.
%end