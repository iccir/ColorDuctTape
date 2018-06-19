// Created by Ricci Adams on 2018-06-18
// Public Domain, https://creativecommons.org/publicdomain/zero/1.0/

#import "AppDelegate.h"
#import "Utils.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSBox *box;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[self box] setFillColor:GetColorNamed(@"DuctTapeRed")];
}

@end
