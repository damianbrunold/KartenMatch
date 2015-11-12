//
//  AppDelegate.m
//  KartenMatch
//
//  Created by Damian Brunold on 03.01.15.
//  Copyright (c) 2015 Damian Brunold. All rights reserved.
//

#import "AppDelegate.h"
#import "PrintView.h"
#import "Solutions.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSWindow *window = [[NSApplication sharedApplication] mainWindow];
    NSView *view = [window contentView];
    [window makeFirstResponder:view];
    self.symbolsPerCard = 8;
    self.cardForm = 0;
    self.cardLayout = 2;
    self.variableSize = NO;
    self.largeSize = NO;
    [self.window.contentView setNeedsDisplay:YES];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


-(IBAction)click3SymbolsPerCard:(id)sender {
    self.symbolsPerCard = 3;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
    for (int i = 8; i <= 57; i++) {
        NSImageView *symbol = [self valueForKey:[NSString stringWithFormat:@"symbol%d", i]];
        symbol.hidden = true;
    }
}

-(IBAction)click4SymbolsPerCard:(id)sender {
    self.symbolsPerCard = 4;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
    for (int i = 8; i <= 13; i++) {
        NSImageView *symbol = [self valueForKey:[NSString stringWithFormat:@"symbol%d", i]];
        symbol.hidden = false;
    }
    for (int i = 14; i <= 57; i++) {
        NSImageView *symbol = [self valueForKey:[NSString stringWithFormat:@"symbol%d", i]];
        symbol.hidden = true;
    }
}

-(IBAction)click6SymbolsPerCard:(id)sender {
    self.symbolsPerCard = 6;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
    for (int i = 8; i <= 31; i++) {
        NSImageView *symbol = [self valueForKey:[NSString stringWithFormat:@"symbol%d", i]];
        symbol.hidden = false;
    }
    for (int i = 32; i <= 57; i++) {
        NSImageView *symbol = [self valueForKey:[NSString stringWithFormat:@"symbol%d", i]];
        symbol.hidden = true;
    }
}

-(IBAction)click8SymbolsPerCard:(id)sender {
    self.symbolsPerCard = 8;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
    for (int i = 8; i <= 57; i++) {
        NSImageView *symbol = [self valueForKey:[NSString stringWithFormat:@"symbol%d", i]];
        symbol.hidden = false;
    }
}

-(IBAction)clickCircleCardForm:(id)sender {
    self.cardForm = 0;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
}

-(IBAction)clickSquareCardForm:(id)sender {
    self.cardForm = 1;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
}

-(IBAction)clickConstantSize:(id)sender {
    self.variableSize = NO;
    self.largeSize = NO;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
}

-(IBAction)clickLargeSize:(id)sender {
    self.variableSize = NO;
    self.largeSize = YES;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
}

-(IBAction)clickVariableSize:(id)sender {
    self.variableSize = YES;
    self.largeSize = NO;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
}

-(IBAction)clickIrregularLayout:(id)sender {
    self.cardLayout = 0;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
}

-(IBAction)clickCircularLayout:(id)sender {
    self.cardLayout = 1;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
}

-(IBAction)clickGridLayout:(id)sender {
    self.cardLayout = 2;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
}

-(IBAction)clickUprightOrientation:(id)sender {
    self.variableOrientation = NO;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
}

-(IBAction)clickVariableOrientation:(id)sender {
    self.variableOrientation = YES;
    NSView *view = [[[NSApplication sharedApplication] mainWindow] contentView];
    [view setNeedsDisplay:YES];
}

-(IBAction)print:(id)sender {
    PrintView *view = [[PrintView alloc] initWithSolution: [self getSolution]];
    NSPrintOperation *op = [NSPrintOperation printOperationWithView:view];
    [op runOperation];
}

- (NSArray*)getSolution {
    switch (self.symbolsPerCard) {
        case 3: return [Solutions solution3];
        case 4: return [Solutions solution4];
        case 6: return [Solutions solution6];
        case 8: return [Solutions solution8];
    }
    return nil;
}


@end
