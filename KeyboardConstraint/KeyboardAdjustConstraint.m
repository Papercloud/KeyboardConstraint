//
//  KeyboardAdjustConstraint.m
//  Happy Wife
//
//  Created by Tomas Spacek on 22/10/2014.
//  Copyright (c) 2014 Papercloud. All rights reserved.
//

#import "KeyboardAdjustConstraint.h"

@implementation KeyboardAdjustConstraint {
    CGFloat _originalConstant;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _originalConstant = self.constant;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_keyboardDidChangeVisible:)
                                                 name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_keyboardDidChangeVisible:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)_keyboardDidChangeVisible:(NSNotification *)notification
{
    NSTimeInterval         animationDuration = 0.0;
    UIViewAnimationOptions animationOptions  = 0;
    CGRect                 endFrame          = CGRectZero;

    if(notification != nil) {
        UIViewAnimationCurve animationCurve = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
        animationOptions  = animationCurve << 16;
        animationDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        endFrame          = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    }

    UIView *superview = [(UIView *)self.firstItem superview];
    CGRect windowRelativeFrame = [superview convertRect:superview.bounds toView:nil];

    CGFloat keyboardHeight = CGRectGetMaxY(windowRelativeFrame) - CGRectGetMinY(endFrame);

    [UIView animateWithDuration:animationDuration
                          delay:0
                        options:animationOptions|UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         [self setConstant:keyboardHeight + _originalConstant];
                         [superview layoutIfNeeded];
                     }
                     completion:NULL];
}

@end
