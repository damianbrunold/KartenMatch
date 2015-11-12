//
//  PrintView.m
//  KartenMatch
//
//  Created by Damian Brunold on 04.01.15.
//  Copyright (c) 2015 Damian Brunold. All rights reserved.
//

#import "PrintView.h"
#import "CardView.h"

@implementation PrintView

- (id)initWithSolution:(NSArray*)sol {
    self = [super init];
    if (self) {
        self->solution = sol;
        self->initialized = NO;
        self->size = 210;
        self->border = 2;
    }
    return self;
}

- (void)layoutSolution {
    if (self->initialized) return;
    NSArray* perm = [self getPerm];
    NSUInteger cards = [solution count];
    NSUInteger cardsx = [self calculateCardsX];
    NSUInteger cardsy = cardsx != 0 ? (cards + cardsx - 1) / cardsx : 0;
    NSUInteger height = cardsy * self->size + (cardsy - 1) * self->border;
    NSUInteger width = cardsx * self->size + (cardsx - 1) * self->border;
    [self setFrame:NSMakeRect(0, 0, width, height)];
    NSUInteger y = self->size;
    for (int j = 0; j < cardsy; j++) {
        NSUInteger x = 0;
        for (int i = 0; i < cardsx; i++) {
            NSUInteger idx = j * cardsx + i;
            if (idx >= cards) break;
            CardView* view = [[CardView alloc] initWithFrame:NSMakeRect(x, height - y, self->size, self->size)];
            [self addSubview:view];
            [view setSymbols: solution[idx] withPermutation:perm];
            x += self->size;
            x += self->border;
        }
        y += self->size;
        y += self->border;
    }
    self->initialized = YES;
}

- (NSArray*) getPerm {
    NSUInteger count = [solution count];
    NSMutableArray* perm = [[NSMutableArray alloc] initWithCapacity:count];
    for (NSUInteger i = 0; i < count; i++) {
        perm[i] = @(i);
    }
    // See http://en.wikipedia.org/wiki/Fisher–Yates_shuffle
    for (NSUInteger i = count - 1; i > 0; --i) {
        [perm exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform((int32_t)(i + 1))];
    }
    return perm;
}

- (BOOL)knowsPageRange:(NSRangePointer)range {
    [self layoutSolution];
    NSRect bounds = [self bounds];
    NSUInteger pageHeight = [self calculatePageHeight];
    range->location = 1;
    range->length = (NSHeight(bounds) + pageHeight - 1) / pageHeight;
    return YES;
}

- (NSRect)rectForPage:(NSInteger)page {
    [self layoutSolution];
    NSRect bounds = [self bounds];
    NSUInteger pageHeight = [self calculatePageHeight];
    CGFloat x = NSMinX(bounds);
    CGFloat y = NSMaxY(bounds) - page * pageHeight - (page - 1) * self->border;
    CGFloat width = NSWidth(bounds);
    return NSMakeRect(x, y, width, pageHeight);
}

- (NSUInteger)calculateCardsX {
    NSPrintInfo *pi = [[NSPrintOperation currentOperation] printInfo];
    NSSize paperSize = [pi paperSize];
    float pageWidth = paperSize.width - [pi leftMargin] - [pi rightMargin];
    float scale = [[[pi dictionary] objectForKey:NSPrintScalingFactor] floatValue];
    float width = pageWidth / scale;
    int cards = 0;
    while (width >= self->size) {
        cards++;
        width -= self->size;
        width -= self->border;
    }
    return cards;
}

- (NSUInteger)calculatePageHeight {
    NSPrintInfo *pi = [[NSPrintOperation currentOperation] printInfo];
    NSSize paperSize = [pi paperSize];
    float pageHeight = paperSize.height - [pi topMargin] - [pi bottomMargin];
    float scale = [[[pi dictionary] objectForKey:NSPrintScalingFactor] floatValue];
    float height = pageHeight / scale;
    int cards = 0;
    while (height >= self->size) {
        cards++;
        height -= self->size;
        height -= self->border;
    }
    return cards == 0 ? 0 : cards * self->size + (cards - 1) * self->border;
}

@end
