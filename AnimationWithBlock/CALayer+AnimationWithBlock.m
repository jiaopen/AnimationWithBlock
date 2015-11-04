//
//  CALayer+AnimationWithBlock.m
//  Triphare
//
//  Created by 李小盆 on 15/11/3.
//  Copyright © 2015年 ___LOTTO___. All rights reserved.
//

#import "CALayer+AnimationWithBlock.h"
#import <objc/runtime.h>

static const char *animation_end = "animation_end";
static const char *animation_start = "animation_start";


@implementation CALayer (AnimationWithBlock)

-(void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key endBlock:(CABasicAnimationBlock)endBlock {
    [self addAnimation:anim forKey:key startBlock:nil endBlock:endBlock];
}

-(void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key startBlock:(CABasicAnimationBlock)startBlock {
    [self addAnimation:anim forKey:key startBlock:startBlock endBlock:nil];
}

-(void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key startBlock:(CABasicAnimationBlock)startBlock endBlock:(CABasicAnimationBlock)endBlock {
    anim.delegate = self;
    if (startBlock) {
        objc_setAssociatedObject(self, animation_start, startBlock, OBJC_ASSOCIATION_COPY);
    }
    if (endBlock) {
        objc_setAssociatedObject(self, animation_end, endBlock, OBJC_ASSOCIATION_COPY);
    }
    [self addAnimation:anim forKey:key];
}

-(void) animationDidStart:(CAAnimation *)anim{
    CABasicAnimationBlock startBlock = objc_getAssociatedObject(self, animation_start);
    if (startBlock) {
        startBlock();
    }
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    CABasicAnimationBlock endBlock = objc_getAssociatedObject(self, animation_end);
    if (endBlock) {
        endBlock();
    }
}
@end
