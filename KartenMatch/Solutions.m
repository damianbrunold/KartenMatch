//
//  Solutions.m
//  KartenMatch
//
//  Created by Damian Brunold on 04.01.15.
//  Copyright (c) 2015 Damian Brunold. All rights reserved.
//

#import "Solutions.h"

@implementation Solutions

+ (NSArray*)solution3 {
    return @[@[@1, @2, @5],
             @[@3, @4, @5],
             @[@1, @3, @6],
             @[@2, @4, @6],
             @[@1, @4, @7],
             @[@2, @3, @7],
             @[@5, @6, @7]];
}

+ (NSArray*)solution4 {
    return @[@[@1, @2, @3, @10],
             @[@4, @5, @6, @10],
             @[@7, @8, @9, @10],
             @[@1, @4, @7, @11],
             @[@2, @5, @8, @11],
             @[@3, @6, @9, @11],
             @[@1, @5, @9, @12],
             @[@2, @6, @7, @12],
             @[@3, @4, @8, @12],
             @[@1, @6, @8, @13],
             @[@2, @4, @9, @13],
             @[@3, @5, @7, @13],
             @[@10, @11, @12, @13]];
}

+ (NSArray*)solution6 {
    return @[@[@1, @2, @3, @4, @5, @26],
             @[@6, @7, @8, @9, @10, @26],
             @[@11, @12, @13, @14, @15, @26],
             @[@16, @17, @18, @19, @20, @26],
             @[@21, @22, @23, @24, @25, @26],
             @[@1, @6, @11, @16, @21, @27],
             @[@2, @7, @12, @17, @22, @27],
             @[@3, @8, @13, @18, @23, @27],
             @[@4, @9, @14, @19, @24, @27],
             @[@5, @10, @15, @20, @25, @27],
             @[@1, @7, @13, @19, @25, @28],
             @[@2, @8, @14, @20, @21, @28],
             @[@3, @9, @15, @16, @22, @28],
             @[@4, @10, @11, @17, @23, @28],
             @[@5, @6, @12, @18, @24, @28],
             @[@1, @8, @15, @17, @24, @29],
             @[@2, @9, @11, @18, @25, @29],
             @[@3, @10, @12, @19, @21, @29],
             @[@4, @6, @13, @20, @22, @29],
             @[@5, @7, @14, @16, @23, @29],
             @[@1, @9, @12, @20, @23, @30],
             @[@2, @10, @13, @16, @24, @30],
             @[@3, @6, @14, @17, @25, @30],
             @[@4, @7, @15, @18, @21, @30],
             @[@5, @8, @11, @19, @22, @30],
             @[@1, @10, @14, @18, @22, @31],
             @[@2, @6, @15, @19, @23, @31],
             @[@3, @7, @11, @20, @24, @31],
             @[@4, @8, @12, @16, @25, @31],
             @[@5, @9, @13, @17, @21, @31],
             @[@26, @27, @28, @29, @30, @31]];
}

+ (NSArray*)solution8 {
    return @[@[@1, @2, @3, @4, @5, @6, @7, @50],
             @[@8, @9, @10, @11, @12, @13, @14, @50],
             @[@15, @16, @17, @18, @19, @20, @21, @50],
             @[@22, @23, @24, @25, @26, @27, @28, @50],
             @[@29, @30, @31, @32, @33, @34, @35, @50],
             @[@36, @37, @38, @39, @40, @41, @42, @50],
             @[@43, @44, @45, @46, @47, @48, @49, @50],
             @[@1, @8, @15, @22, @29, @36, @43, @51],
             @[@2, @9, @16, @23, @30, @37, @44, @51],
             @[@3, @10, @17, @24, @31, @38, @45, @51],
             @[@4, @11, @18, @25, @32, @39, @46, @51],
             @[@5, @12, @19, @26, @33, @40, @47, @51],
             @[@6, @13, @20, @27, @34, @41, @48, @51],
             @[@7, @14, @21, @28, @35, @42, @49, @51],
             @[@1, @9, @17, @25, @33, @41, @49, @52],
             @[@2, @10, @18, @26, @34, @42, @43, @52],
             @[@3, @11, @19, @27, @35, @36, @44, @52],
             @[@4, @12, @20, @28, @29, @37, @45, @52],
             @[@5, @13, @21, @22, @30, @38, @46, @52],
             @[@6, @14, @15, @23, @31, @39, @47, @52],
             @[@7, @8, @16, @24, @32, @40, @48, @52],
             @[@1, @10, @19, @28, @30, @39, @48, @53],
             @[@2, @11, @20, @22, @31, @40, @49, @53],
             @[@3, @12, @21, @23, @32, @41, @43, @53],
             @[@4, @13, @15, @24, @33, @42, @44, @53],
             @[@5, @14, @16, @25, @34, @36, @45, @53],
             @[@6, @8, @17, @26, @35, @37, @46, @53],
             @[@7, @9, @18, @27, @29, @38, @47, @53],
             @[@1, @11, @21, @24, @34, @37, @47, @54],
             @[@2, @12, @15, @25, @35, @38, @48, @54],
             @[@3, @13, @16, @26, @29, @39, @49, @54],
             @[@4, @14, @17, @27, @30, @40, @43, @54],
             @[@5, @8, @18, @28, @31, @41, @44, @54],
             @[@6, @9, @19, @22, @32, @42, @45, @54],
             @[@7, @10, @20, @23, @33, @36, @46, @54],
             @[@1, @12, @16, @27, @31, @42, @46, @55],
             @[@2, @13, @17, @28, @32, @36, @47, @55],
             @[@3, @14, @18, @22, @33, @37, @48, @55],
             @[@4, @8, @19, @23, @34, @38, @49, @55],
             @[@5, @9, @20, @24, @35, @39, @43, @55],
             @[@6, @10, @21, @25, @29, @40, @44, @55],
             @[@7, @11, @15, @26, @30, @41, @45, @55],
             @[@1, @13, @18, @23, @35, @40, @45, @56],
             @[@2, @14, @19, @24, @29, @41, @46, @56],
             @[@3, @8, @20, @25, @30, @42, @47, @56],
             @[@4, @9, @21, @26, @31, @36, @48, @56],
             @[@5, @10, @15, @27, @32, @37, @49, @56],
             @[@6, @11, @16, @28, @33, @38, @43, @56],
             @[@7, @12, @17, @22, @34, @39, @44, @56],
             @[@1, @14, @20, @26, @32, @38, @44, @57],
             @[@2, @8, @21, @27, @33, @39, @45, @57],
             @[@3, @9, @15, @28, @34, @40, @46, @57],
             @[@4, @10, @16, @22, @35, @41, @47, @57],
             @[@5, @11, @17, @23, @29, @42, @48, @57],
             @[@6, @12, @18, @24, @30, @36, @49, @57],
             @[@7, @13, @19, @25, @31, @37, @43, @57],
             @[@50, @51, @52, @53, @54, @55, @56, @57]];
}

@end