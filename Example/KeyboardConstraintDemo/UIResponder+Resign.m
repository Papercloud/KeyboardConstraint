//
//  UIResponder+Resign.m
//  KeyboardConstraintDemo
//
//  Created by Mark Turner on 01/12/2014.
//  Copyright (c) 2014 Papercloud. All rights reserved.
//

#import "UIResponder+Resign.h"

@implementation UIResponder (Resign)

- (void)resign:(id)sender
{
    [self resignFirstResponder];
}

@end
