//
//  PreviewView.m
//  KartenMatch
//
//  Created by Damian Brunold on 03.01.15.
//  Copyright (c) 2015 Damian Brunold. All rights reserved.
//

#import "CardView.h"
#import "AppDelegate.h"

#include <math.h>

@implementation CardView {
    int symbolsPerCard;
    int cardForm;
    int cardLayout;
    BOOL variableSize;
    BOOL largeSize;
    BOOL variableOrientation;
    NSArray* symbols;
    BOOL symbolsSet;
}

- (void)setSymbols:(NSArray*)newSymbols withPermutation:(NSArray *)perm {
    NSMutableArray *temp = [[NSMutableArray alloc] initWithCapacity:[newSymbols count]];
    for (int i = 0; i < [newSymbols count]; i++) {
        NSUInteger idx = [newSymbols[i] integerValue];
        if (perm) {
            idx = [perm[idx - 1] integerValue] + 1;
        }
        temp[i] = [self getSymbolImage:idx];
    }
    [self shuffle: temp];
    symbols = temp;
    symbolsSet = YES;
    [self setNeedsDisplay:YES];
}

- (void)shuffle:(NSMutableArray*)array {
    NSUInteger count = [array count];
    // See http://en.wikipedia.org/wiki/Fisher–Yates_shuffle
    if (count > 1) {
        for (NSUInteger i = count - 1; i > 0; --i) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform((int32_t)(i + 1))];
        }
    }
}

- (NSImage*)getSymbolImage:(NSUInteger)i {
    AppDelegate* app = (AppDelegate*)[[NSApplication sharedApplication] delegate];
    return [[app valueForKey:[NSString stringWithFormat:@"symbol%ld", (long)i]] image];
}

- (void)setDefaultSymbols {
    AppDelegate* app = (AppDelegate*)[[NSApplication sharedApplication] delegate];
    symbols = @[app.symbol1.image, app.symbol2.image, app.symbol3.image, app.symbol4.image,
                app.symbol5.image, app.symbol6.image, app.symbol7.image, app.symbol8.image];
    symbolsSet = NO;
    [self setNeedsDisplay:YES];
}

- (void)updateSettings {
    AppDelegate* app = (AppDelegate*)[[NSApplication sharedApplication] delegate];
    symbolsPerCard = app.symbolsPerCard;
    cardForm = app.cardForm;
    cardLayout = app.cardLayout;
    variableSize = app.variableSize;
    variableOrientation = app.variableOrientation;
    largeSize = app.largeSize;
    if (symbols == nil || !symbolsSet) [self setDefaultSymbols];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];

    [self updateSettings];
    
    NSRect bounds = NSInsetRect([self bounds], 2, 2);
    
    if (cardForm == 0) {
        [self drawCircleBorder:bounds];
    } else {
        [self drawSquareBorder:bounds];
    }
    
    if (cardLayout == 0) {
        [self drawIrregularLayout:bounds];
    } else if (cardLayout == 1) {
        [self drawCircularLayout:bounds];
    } else if (cardLayout == 2) {
        [self drawGridLayout:bounds];
    }
}

- (void)drawCircleBorder:(NSRect) bounds {
    NSBezierPath* path =[NSBezierPath bezierPathWithOvalInRect: bounds];
    [[NSColor whiteColor] set];
    [path fill];
    [[NSColor blackColor] set];
    [path stroke];
}

- (void)drawSquareBorder:(NSRect) bounds {
    NSBezierPath* path =[NSBezierPath bezierPathWithRect: bounds];
    [[NSColor whiteColor] set];
    [path fill];
    [[NSColor blackColor] set];
    [path stroke];
}

- (void)drawIrregularLayout:(NSRect) bounds {
    CGFloat x0 = bounds.origin.x;
    CGFloat y0 = bounds.origin.y;
    CGFloat dx = bounds.size.width / 100;
    CGFloat dy = bounds.size.height / 100;
    
    switch (symbolsPerCard) {
        case 3:
            [self drawSymbol:symbols[0] at: NSMakePoint(x0 + 25 * dx, y0 + 40 * dy)];
            [self drawSymbol:symbols[1] at: NSMakePoint(x0 + 50 * dx, y0 + 70 * dy)];
            [self drawSymbol:symbols[2] at: NSMakePoint(x0 + 75 * dx, y0 + 30 * dy)];
            break;
            
        case 4:
            [self drawSymbol:symbols[0] at: NSMakePoint(x0 + 30 * dx, y0 + 30 * dy)];
            [self drawSymbol:symbols[1] at: NSMakePoint(x0 + 40 * dx, y0 + 70 * dy)];
            [self drawSymbol:symbols[2] at: NSMakePoint(x0 + 60 * dx, y0 + 30 * dy)];
            [self drawSymbol:symbols[3] at: NSMakePoint(x0 + 80 * dx, y0 + 55 * dy)];
            break;
            
        case 6:
            [self drawSymbol:symbols[0] at: NSMakePoint(x0 + 25 * dx, y0 + 35 * dy)];
            [self drawSymbol:symbols[1] at: NSMakePoint(x0 + 35 * dx, y0 + 68 * dy)];
            [self drawSymbol:symbols[2] at: NSMakePoint(x0 + 52 * dx, y0 + 23 * dy)];
            [self drawSymbol:symbols[3] at: NSMakePoint(x0 + 55 * dx, y0 + 52 * dy)];
            [self drawSymbol:symbols[4] at: NSMakePoint(x0 + 75 * dx, y0 + 40 * dy)];
            [self drawSymbol:symbols[5] at: NSMakePoint(x0 + 70 * dx, y0 + 70 * dy)];
            break;
            
        case 8:
            [self drawSymbol:symbols[0] at: NSMakePoint(x0 + 20 * dx, y0 + 50 * dy)];
            [self drawSymbol:symbols[1] at: NSMakePoint(x0 + 35 * dx, y0 + 20 * dy)];
            [self drawSymbol:symbols[2] at: NSMakePoint(x0 + 30 * dx, y0 + 80 * dy)];
            [self drawSymbol:symbols[3] at: NSMakePoint(x0 + 50 * dx, y0 + 50 * dy)];
            [self drawSymbol:symbols[4] at: NSMakePoint(x0 + 58 * dx, y0 + 75 * dy)];
            [self drawSymbol:symbols[5] at: NSMakePoint(x0 + 65 * dx, y0 + 25 * dy)];
            [self drawSymbol:symbols[6] at: NSMakePoint(x0 + 85 * dx, y0 + 40 * dy)];
            [self drawSymbol:symbols[7] at: NSMakePoint(x0 + 80 * dx, y0 + 64 * dy)];
            break;
    }
}

- (void)drawCircularLayout:(NSRect) bounds {
    NSUInteger symbolSize = [self symbolSize:bounds];
    NSPoint center = NSMakePoint(bounds.origin.x + bounds.size.width / 2,
                                 bounds.origin.y + bounds.size.height / 2);
    CGFloat radius = bounds.size.width / 2 - symbolSize;
    if (largeSize) radius *= 1.3;
    CGFloat mradius = radius * 4 / 5;
    CGFloat sradius = radius * 2 / 3;
    
    switch (symbolsPerCard) {
        case 3:
            [self drawSymbol:symbols[0] at: [self polarToCartesian:center radius:sradius angleInDegrees:90 + 0*120]];
            [self drawSymbol:symbols[1] at: [self polarToCartesian:center radius:sradius angleInDegrees:90 + 1*120]];
            [self drawSymbol:symbols[2] at: [self polarToCartesian:center radius:sradius angleInDegrees:90 + 2*120]];
            break;
            
        case 4:
            [self drawSymbol:symbols[0] at: [self polarToCartesian:center radius:sradius angleInDegrees:90 + 0*90]];
            [self drawSymbol:symbols[1] at: [self polarToCartesian:center radius:sradius angleInDegrees:90 + 1*90]];
            [self drawSymbol:symbols[2] at: [self polarToCartesian:center radius:sradius angleInDegrees:90 + 2*90]];
            [self drawSymbol:symbols[3] at: [self polarToCartesian:center radius:sradius angleInDegrees:90 + 3*90]];
            break;
            
        case 6:
            [self drawSymbol:symbols[0] at: [self polarToCartesian:center radius:mradius angleInDegrees:90 + 0*60]];
            [self drawSymbol:symbols[1] at: [self polarToCartesian:center radius:mradius angleInDegrees:90 + 1*60]];
            [self drawSymbol:symbols[2] at: [self polarToCartesian:center radius:mradius angleInDegrees:90 + 2*60]];
            [self drawSymbol:symbols[3] at: [self polarToCartesian:center radius:mradius angleInDegrees:90 + 3*60]];
            [self drawSymbol:symbols[4] at: [self polarToCartesian:center radius:mradius angleInDegrees:90 + 4*60]];
            [self drawSymbol:symbols[5] at: [self polarToCartesian:center radius:mradius angleInDegrees:90 + 5*60]];
            break;
            
        case 8:
            [self drawSymbol:symbols[0] at: [self polarToCartesian:center radius:radius angleInDegrees:90 + 0*45]];
            [self drawSymbol:symbols[1] at: [self polarToCartesian:center radius:radius angleInDegrees:90 + 1*45]];
            [self drawSymbol:symbols[2] at: [self polarToCartesian:center radius:radius angleInDegrees:90 + 2*45]];
            [self drawSymbol:symbols[3] at: [self polarToCartesian:center radius:radius angleInDegrees:90 + 3*45]];
            [self drawSymbol:symbols[4] at: [self polarToCartesian:center radius:radius angleInDegrees:90 + 4*45]];
            [self drawSymbol:symbols[5] at: [self polarToCartesian:center radius:radius angleInDegrees:90 + 5*45]];
            [self drawSymbol:symbols[6] at: [self polarToCartesian:center radius:radius angleInDegrees:90 + 6*45]];
            [self drawSymbol:symbols[7] at: [self polarToCartesian:center radius:radius angleInDegrees:90 + 7*45]];
            break;
    }
}

- (void)drawGridLayout:(NSRect) bounds {
    NSUInteger symbolSize = [self symbolSize:bounds];
    NSPoint center = NSMakePoint(bounds.origin.x + bounds.size.width / 2,
                                 bounds.origin.y + bounds.size.height / 2);
    CGFloat radius = (bounds.size.width / 2 - symbolSize) * 2 / 3;
    
    switch (symbolsPerCard) {
        case 3:
            [self drawSymbol:symbols[0] at: [self polarToCartesian:center radius:radius angleInDegrees:90]];
            [self drawSymbol:symbols[1] at: [self polarToCartesian:center radius:radius angleInDegrees:210]];
            [self drawSymbol:symbols[2] at: [self polarToCartesian:center radius:radius angleInDegrees:330]];
            break;
            
        case 4:
            [self drawSymbol:symbols[0] at: NSMakePoint(bounds.origin.x + 1 * bounds.size.width / 3,
                                                         bounds.origin.y + 1 * bounds.size.height / 3)];
            [self drawSymbol:symbols[1] at: NSMakePoint(bounds.origin.x + 2 * bounds.size.width / 3,
                                                         bounds.origin.y + 1 * bounds.size.height / 3)];
            [self drawSymbol:symbols[2] at: NSMakePoint(bounds.origin.x + 1 * bounds.size.width / 3,
                                                         bounds.origin.y + 2 * bounds.size.height / 3)];
            [self drawSymbol:symbols[3] at: NSMakePoint(bounds.origin.x + 2 * bounds.size.width / 3,
                                                         bounds.origin.y + 2 * bounds.size.height / 3)];
            break;
            
        case 6:
            [self drawSymbol:symbols[0] at: NSMakePoint(bounds.origin.x + 1 * bounds.size.width / 4,
                                                         bounds.origin.y + 1 * bounds.size.height / 3)];
            [self drawSymbol:symbols[1] at: NSMakePoint(bounds.origin.x + 2 * bounds.size.width / 4,
                                                         bounds.origin.y + 1 * bounds.size.height / 3)];
            [self drawSymbol:symbols[2] at: NSMakePoint(bounds.origin.x + 3 * bounds.size.width / 4,
                                                         bounds.origin.y + 1 * bounds.size.height / 3)];
            [self drawSymbol:symbols[3] at: NSMakePoint(bounds.origin.x + 1 * bounds.size.width / 4,
                                                         bounds.origin.y + 2 * bounds.size.height / 3)];
            [self drawSymbol:symbols[4] at: NSMakePoint(bounds.origin.x + 2 * bounds.size.width / 4,
                                                         bounds.origin.y + 2 * bounds.size.height / 3)];
            [self drawSymbol:symbols[5] at: NSMakePoint(bounds.origin.x + 3 * bounds.size.width / 4,
                                                         bounds.origin.y + 2 * bounds.size.height / 3)];
            break;
            
        case 8:
            [self drawSymbol:symbols[0] at: NSMakePoint(bounds.origin.x + 1 * bounds.size.width / 4,
                                                         bounds.origin.y + 1 * bounds.size.height / 4)];
            [self drawSymbol:symbols[1] at: NSMakePoint(bounds.origin.x + 2 * bounds.size.width / 4,
                                                         bounds.origin.y + 1 * bounds.size.height / 4)];
            [self drawSymbol:symbols[2] at: NSMakePoint(bounds.origin.x + 3 * bounds.size.width / 4,
                                                         bounds.origin.y + 1 * bounds.size.height / 4)];
            
            [self drawSymbol:symbols[3] at: NSMakePoint(bounds.origin.x + 2 * bounds.size.width / 6,
                                                         bounds.origin.y + 2 * bounds.size.height / 4)];
            [self drawSymbol:symbols[4] at: NSMakePoint(bounds.origin.x + 4 * bounds.size.width / 6,
                                                         bounds.origin.y + 2 * bounds.size.height / 4)];
            
            [self drawSymbol:symbols[5] at: NSMakePoint(bounds.origin.x + 1 * bounds.size.width / 4,
                                                         bounds.origin.y + 3 * bounds.size.height / 4)];
            [self drawSymbol:symbols[6] at: NSMakePoint(bounds.origin.x + 2 * bounds.size.width / 4,
                                                         bounds.origin.y + 3 * bounds.size.height / 4)];
            [self drawSymbol:symbols[7] at: NSMakePoint(bounds.origin.x + 3 * bounds.size.width / 4,
                                                         bounds.origin.y + 3 * bounds.size.height / 4)];
            break;
    }
}

- (NSPoint)polarToCartesian:(NSPoint)origin radius:(CGFloat)radius angleInDegrees:(int)angle {
    return NSMakePoint(origin.x + radius * cos(angle / 180.0 * M_PI),
                       origin.y + radius * sin(angle / 180.0 * M_PI));
}

- (void)drawSymbol:(NSImage*)image at:(NSPoint)pt {
    NSUInteger symbolSize = [self symbolSize:[self bounds]];
    NSSize size = NSMakeSize(symbolSize, symbolSize);
    if (image.size.width > image.size.height) {
        size.height = size.height * image.size.height / image.size.width;
    } else {
        size.width = size.width * image.size.width / image.size.height;
    }
    NSAffineTransform* xform = [NSAffineTransform transform];
    [xform translateXBy:pt.x yBy:pt.y];
    if (variableOrientation) {
        [xform rotateByDegrees:arc4random_uniform(360)];
    }
    if (variableSize) {
        // scale between 75% and 145%
        CGFloat scale = 100.0 / (75.0 + arc4random_uniform(70));
        [xform scaleBy:scale];
    }
    [xform concat];
    NSRect rect = NSMakeRect(- size.width / 2, - size.height / 2, size.width, size.height);
    [image drawInRect:rect];
    [xform invert];
    [xform concat];
}

- (NSUInteger)symbolSize:(NSRect)bounds {
    return bounds.size.width * [self scale];
}

- (double)scale {
    if (largeSize) return 0.26;
    else return 0.2;
}

@end
