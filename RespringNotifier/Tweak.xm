%hook SpringBoard


-(void)applicationDidFinishLaunching:(id)application {

    %orig;
    
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Welcome"
        message:@"This is a test."
        delegate:self
        cancelButtonTitle:@"Testing"
        otherButtonTitles:nil];
    [alert1 show];
    [alert1 release];

}


%end