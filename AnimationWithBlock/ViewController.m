//
//  ViewController.m
//  AnimationWithBlock
//
//  Created by 李小盆 on 15/11/4.
//  Copyright © 2015年 Zip Lee. All rights reserved.
//

#import "ViewController.h"
#import "CALayer+AnimationWithBlock.h"

@interface ViewController ()

@property(nonatomic, strong) IBOutlet UIButton* animationButton;
@property(nonatomic, assign) NSUInteger cycleCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(IBAction)action:(UIButton*)sender{
    CABasicAnimation *reversAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    reversAnim.fromValue=@(0);
    reversAnim.toValue = @(M_PI*2);
    reversAnim.duration = 0.3;
    _cycleCount++;
    __weak UIButton* weakButton = sender;
    [sender.layer addAnimation:reversAnim forKey:@"rotation" endBlock:^{
        [weakButton setTitle:[NSString stringWithFormat:@"%@", @(_cycleCount)] forState:UIControlStateNormal];
    }];
}

@end
