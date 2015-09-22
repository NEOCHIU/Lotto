//
//  LottoViewController.h
//  ViewOfLotto
//
//  Created by kid chiu on 2015/7/11.
//  Copyright (c) 2015年 kidmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LottoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *numOfBaseTextField;
@property (weak, nonatomic) IBOutlet UITextField *numOfGuessTextField;
- (IBAction)guessBallButton:(id)sender;



@end
