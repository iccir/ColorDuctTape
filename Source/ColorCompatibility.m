// Created by Ricci Adams on 2018-06-18
// Public Domain, https://creativecommons.org/publicdomain/zero/1.0/

#import "ColorCompatibility.h"

typedef struct { char *name; float r; float g; float b; float a; } ColorDataEntry;
extern const ColorDataEntry ColorCompatibilityData[];


static NSDictionary *sColorMap = nil;


static void sGenerateColorMap()
{
    const ColorDataEntry *e = ColorCompatibilityData;
    
    NSMutableDictionary *map = [NSMutableDictionary dictionary];

    while (e->name) {
        NSString *key = [NSString stringWithCString:e->name encoding:NSUTF8StringEncoding];
        NSColor *color = [NSColor colorWithSRGBRed:e->r green:e->g blue:e->b alpha:e->a];

        [map setObject:color forKey:key];
        
        e++;
    }

    sColorMap = map;
}


extern NSColor *GetCompatibilityColorNamed(NSString *name)
{
    if (!sColorMap) sGenerateColorMap();
    return [sColorMap objectForKey:name];
}