//
//  CardView.h
//  KartenMatch
//
//  Created by Damian Brunold on 03.01.15.
//  Copyright (c) 2015 Damian Brunold. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

@interface CardView : NSView

-(void)setDefaultSymbols;

-(void)setSymbols:(NSArray*)symbols withPermutation:(NSArray*)perm;

@end
