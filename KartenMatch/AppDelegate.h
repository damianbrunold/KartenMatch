//
//  AppDelegate.h
//  KartenMatch
//
//  Created by Damian Brunold on 03.01.15.
//  Copyright (c) 2015 Damian Brunold. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property IBOutlet NSImageView* symbol1;
@property IBOutlet NSImageView* symbol2;
@property IBOutlet NSImageView* symbol3;
@property IBOutlet NSImageView* symbol4;
@property IBOutlet NSImageView* symbol5;
@property IBOutlet NSImageView* symbol6;
@property IBOutlet NSImageView* symbol7;
@property IBOutlet NSImageView* symbol8;
@property IBOutlet NSImageView* symbol9;
@property IBOutlet NSImageView* symbol10;

@property IBOutlet NSImageView* symbol11;
@property IBOutlet NSImageView* symbol12;
@property IBOutlet NSImageView* symbol13;
@property IBOutlet NSImageView* symbol14;
@property IBOutlet NSImageView* symbol15;
@property IBOutlet NSImageView* symbol16;
@property IBOutlet NSImageView* symbol17;
@property IBOutlet NSImageView* symbol18;
@property IBOutlet NSImageView* symbol19;
@property IBOutlet NSImageView* symbol20;

@property IBOutlet NSImageView* symbol21;
@property IBOutlet NSImageView* symbol22;
@property IBOutlet NSImageView* symbol23;
@property IBOutlet NSImageView* symbol24;
@property IBOutlet NSImageView* symbol25;
@property IBOutlet NSImageView* symbol26;
@property IBOutlet NSImageView* symbol27;
@property IBOutlet NSImageView* symbol28;
@property IBOutlet NSImageView* symbol29;
@property IBOutlet NSImageView* symbol30;

@property IBOutlet NSImageView* symbol31;
@property IBOutlet NSImageView* symbol32;
@property IBOutlet NSImageView* symbol33;
@property IBOutlet NSImageView* symbol34;
@property IBOutlet NSImageView* symbol35;
@property IBOutlet NSImageView* symbol36;
@property IBOutlet NSImageView* symbol37;
@property IBOutlet NSImageView* symbol38;
@property IBOutlet NSImageView* symbol39;
@property IBOutlet NSImageView* symbol40;

@property IBOutlet NSImageView* symbol41;
@property IBOutlet NSImageView* symbol42;
@property IBOutlet NSImageView* symbol43;
@property IBOutlet NSImageView* symbol44;
@property IBOutlet NSImageView* symbol45;
@property IBOutlet NSImageView* symbol46;
@property IBOutlet NSImageView* symbol47;
@property IBOutlet NSImageView* symbol48;
@property IBOutlet NSImageView* symbol49;
@property IBOutlet NSImageView* symbol50;

@property IBOutlet NSImageView* symbol51;
@property IBOutlet NSImageView* symbol52;
@property IBOutlet NSImageView* symbol53;
@property IBOutlet NSImageView* symbol54;
@property IBOutlet NSImageView* symbol55;
@property IBOutlet NSImageView* symbol56;
@property IBOutlet NSImageView* symbol57;

@property int symbolsPerCard;
@property int cardLayout;
@property int cardForm;
@property BOOL variableSize;
@property BOOL variableOrientation;
@property BOOL largeSize;

-(IBAction)click3SymbolsPerCard:(id)sender;

-(IBAction)click4SymbolsPerCard:(id)sender;

-(IBAction)click6SymbolsPerCard:(id)sender;

-(IBAction)click8SymbolsPerCard:(id)sender;

-(IBAction)clickCircleCardForm:(id)sender;

-(IBAction)clickSquareCardForm:(id)sender;

-(IBAction)clickConstantSize:(id)sender;

-(IBAction)clickVariableSize:(id)sender;

-(IBAction)clickLargeSize:(id)sender;

-(IBAction)clickIrregularLayout:(id)sender;

-(IBAction)clickCircularLayout:(id)sender;

-(IBAction)clickGridLayout:(id)sender;

-(IBAction)clickUprightOrientation:(id)sender;

-(IBAction)clickVariableOrientation:(id)sender;

-(IBAction)print:(id)sender;

@end

