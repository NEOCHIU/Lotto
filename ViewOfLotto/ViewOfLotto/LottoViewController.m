//
//  LottoViewController.m
//  ViewOfLotto
//
//  Created by kid chiu on 2015/7/11.
//  Copyright (c) 2015年 kidmac. All rights reserved.
//

#import "LottoViewController.h"
#import "LottoModel.h"
@interface LottoViewController ()

@end

@implementation LottoViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // cathy added a change
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)guessBallButton:(id)sender {
//    NSLog(@"NumOfBase:%@",self.numOfBaseTextField.text);
//    NSLog(@"NumOfGuess:%@",self.numOfGuessTextField.text);
    [self.numOfBaseTextField resignFirstResponder];
    [self.numOfGuessTextField resignFirstResponder];
    NSInteger baseNume = self.numOfBaseTextField.text.integerValue;
    NSInteger guessNume = self.numOfGuessTextField.text.integerValue;
    
    LottoModel *myLottModel = [LottoModel new];
    NSMutableArray *resultBalls = [NSMutableArray array];
    resultBalls = [myLottModel genGuessWithBase:baseNume andGuess:guessNume];
    NSLog(@"resultBall: %@",resultBalls);
        //氣泡排序法
        for (int i = 0; i < guessNume - 1; i ++) {
            for (int j = i + 1; j < guessNume; j ++) {
                if ([resultBalls[i] integerValue] > [resultBalls[j] integerValue]) {
                    [resultBalls exchangeObjectAtIndex:i withObjectAtIndex:j];
                }
            }
        }
    
    
    
        UILabel *resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(78, 350, 248, 100)];
        resultLabel.tag = 111;
        resultLabel.text = @"";
        for (int i = 0; i < guessNume; i ++) {
            resultLabel.text = [resultLabel.text stringByAppendingFormat:@"%@\t", resultBalls[i]];
        }
    
        [UIView animateWithDuration:1 animations:^{
            resultLabel.center = CGPointMake(resultLabel.center.x, resultLabel.center.y - 100);
            [self.view addSubview:resultLabel];
        } completion:^(BOOL finished) {
            UILabel *greetLabel = [[UILabel alloc] initWithFrame:CGRectMake(78, 350, 248, 100)];
            greetLabel.font = [UIFont systemFontOfSize:35];
            greetLabel.text = @"祝您中獎！！";
            greetLabel.tag = 222;
            [self.view addSubview:greetLabel];
        }];

}
@end
