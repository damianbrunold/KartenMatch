//
//  PrintView.h
//  KartenMatch
//
//  Created by Damian Brunold on 04.01.15.
//  Copyright (c) 2015 Damian Brunold. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PrintView : NSView {
    NSArray* solution;
    BOOL initialized;
    int size;
    int border;
}

-(id)initWithSolution:(NSArray*)solution;

-(void)layoutSolution;

@end
