//
//  UIColor+TDApplicationSpecific.m
//  TDUICatalog
//
//  Created by Danny Ho on 4/17/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "UIColor+TDApplicationSpecific.h"

@implementation UIColor (TDApplicationSpecific)

+ (UIColor *)td_applicationGreenColor {
    return [UIColor colorWithRed:0.255 green:0.804 blue:0.470 alpha:1];
}

+ (UIColor *)td_applicationBlueColor {
    return [UIColor colorWithRed:0.333 green:0.784 blue:1 alpha:1];
}

+ (UIColor *)td_applicationPurpleColor {
    return [UIColor colorWithRed:0.659 green:0.271 blue:0.988 alpha:1];
}

@end
