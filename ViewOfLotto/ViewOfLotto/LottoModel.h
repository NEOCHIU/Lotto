//
//  LottoModel.h
//  ViewOfLotto
//
//  Created by kid chiu on 2015/7/18.
//  Copyright (c) 2015年 kidmac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LottoModel : NSObject{
    BOOL reversed;
}
@property (nonatomic)NSInteger numOfBase;
@property (nonatomic)NSInteger numOfGuess;
@property (nonatomic,strong)NSMutableArray *lottBalls;
@property (nonatomic,strong)NSMutableArray *guessBalls;
@property (nonatomic,strong)NSMutableArray *restBalls;

-(NSMutableArray *)genGuessWithBase:(NSInteger)bassNumber andGuess:(NSInteger)guessNumber;
-(void)genGuessBalls;





@end
