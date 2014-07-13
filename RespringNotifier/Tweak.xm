//Here, using Logos's 'hook' construct to access the SpringBoard class. 'Hooking' basically means we want to access this class and modify the methods inside it.
%hook SpringBoard

//Now that logos knows we want to hook the header SpringBoard, we can directly 'hijack' SpringBoard's methods and modify them to run out own code instead of their original code.

//In this example, we are hijacking the method - (void)applicationDidFinishLaunching and making it run our own code. This method takes an argument, (id)application, however, you can rename the argument anything you'd like, such as (id)testName.
-(void)applicationDidFinishLaunching:(id)application {

    //Before we do anything, let's call the original method so SpringBoard knows what to do when it finishes launching. '%orig' basically means 'do whatever you were going to do before I got here'.
    %orig;
    
    
    //Now that SpringBoard has finished launching and everything turned out okay, let's make a UIAlertView to tell us that it finished respringing.
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Welcome"
        message:@"This is a test."
        delegate:self
        cancelButtonTitle:@"Testing"
        otherButtonTitles:nil];
    //Now show that alert
    [alert1 show];
    //And release it. We don't want any memory leaks ;)
    [alert1 release];

}
//This lets logos know we're done hooking this header.
%end