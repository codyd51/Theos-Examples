NSString *wrongPass = nil;

%hook SBDeviceLockController

    - (BOOL)attemptDeviceUnlockWithPassword:(id)passEntered appRequested:(BOOL)arg2 {

        if (!%orig) {
        
            wrongPass = passEntered;
        
        }
        
        return %orig;
    
    }

%end

%hook SBUIPasscodeLockViewWithKeypad

    - (id)statusTitleView {

            if (wrongPass != nil) {

                UILabel *label = MSHookIvar<UILabel *>(self, "_statusTitleView");
                label.text = [NSString stringWithFormat:@"You entered %@", wrongPass];
                return label;

            }
            
            return %orig;
        }

%end
