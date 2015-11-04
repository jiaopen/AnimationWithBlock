//
//  CALayer+AnimationWithBlock.h
//  Triphare
//
//  Created by 李小盆 on 15/11/3.
//  Copyright © 2015年 ___LOTTO___. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CABasicAnimationBlock)();

@interface CALayer (AnimationWithBlock)

- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key endBlock:(CABasicAnimationBlock)endBlock;
- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key startBlock:(CABasicAnimationBlock)startBlock;
- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key startBlock:(CABasicAnimationBlock)startBlock endBlock:(CABasicAnimationBlock)endBlock;

@end
