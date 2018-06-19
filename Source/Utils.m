// Created by Ricci Adams on 2018-06-18
// Public Domain, https://creativecommons.org/publicdomain/zero/1.0/

#import "Utils.h"
#import "ColorCompatibility.h"

extern NSColor *GetColorNamed(NSColorName colorName)
{
    NSColor *color = nil;

    if (colorName) {
        if (@available(macOS 10.13, *)) {
            color = [NSColor colorNamed:colorName];
        } else {
            color = GetCompatibilityColorNamed(colorName);
        }

        NSCAssert(color, @"Unknown color name: %@", colorName);
    }

    return color;
}
