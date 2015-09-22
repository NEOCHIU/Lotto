//
//  LottoModel.m
//  ViewOfLotto
//
//  Created by kid chiu on 2015/7/18.
//  Copyright (c) 2015年 kidmac. All rights reserved.
//

#import "LottoModel.h"

@implementation LottoModel
@synthesize numOfBase;
@synthesize numOfGuess;
@synthesize lottBalls;
@synthesize guessBalls;
@synthesize restBalls;


-(NSMutableArray *)genGuessWithBase:(NSInteger)bassNumber andGuess:(NSInteger)guessNumber{
    reversed = NO;
    if (bassNumber < guessNumber) {
        NSLog(@"猜的值需小於總數的值");
        return nil;
    }
    if (guessNumber > bassNumber/2) {
        self.numOfGuess = bassNumber - guessNumber;
        reversed = YES;
    }else{
        self.numOfGuess = guessNumber;
    }
    self.numOfBase = bassNumber;
    [self genGuessBalls];
    if(reversed){
        return self.restBalls;
    }
    return self.guessBalls;
}

-(void)genGuessBalls{
    self.lottBalls = [NSMutableArray arrayWithCapacity:self.numOfBase];
    self.guessBalls =  [NSMutableArray arrayWithCapacity:self.numOfBase];
    
    for (NSInteger ballVlue = 0 ; ballVlue < self.numOfBase; ballVlue++) {
        [self.lottBalls addObject:[NSNumber numberWithInteger:(ballVlue+1)]];
    }
    for (NSInteger guessOrder = 0 ; guessOrder < self.numOfGuess; guessOrder++) {
        NSNumber *selectedNumber =  [self.lottBalls objectAtIndex:(arc4random() % (self.numOfBase - guessOrder))];
        [self.guessBalls addObject:selectedNumber];
        [self.lottBalls removeObject:selectedNumber];
    }
    self.restBalls = self.lottBalls;
    
}


@end
