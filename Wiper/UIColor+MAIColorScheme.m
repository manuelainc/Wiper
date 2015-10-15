//
//  UIColor+MAIColorScheme.m
//  Wiper
//
//  Created by Sherpa on 14/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import "UIColor+MAIColorScheme.h"

@implementation UIColor (MAIColorScheme)

+ (UIColor *) maiYellowDarkColor{

    return [UIColor colorWithRed:1.00 green:0.93 blue:0.58 alpha:1.0];
}

+ (UIColor *) maiPinkColor{
    
    return [UIColor colorWithRed:1.00 green:0.68 blue:0.68 alpha:1.0];
}

+ (UIColor *) maiYellowLigthColor{

    return [UIColor colorWithRed:1.00 green:0.94 blue:0.67 alpha:1.0];
}

+ (UIColor *) maiGreenColor{
    
    return [UIColor colorWithRed:0.69 green:0.90 blue:0.49 alpha:1.0];
}

+ (UIColor *) maiBlueLightColor{
    
    return [UIColor colorWithRed:0.71 green:0.85 blue:0.91 alpha:1.0];
}

+ (UIColor *) maiBlueDarkColor{
    
    return [UIColor colorWithRed:0.34 green:0.73 blue:0.93 alpha:1.0];
}

+ (UIColor *) getColorForSection:(NSString *)sectionSt{
    if ([sectionSt isEqualToString:@"Wash"]) {
        return [self maiBlueLightColor];
    }else if ([sectionSt isEqualToString:@"Bleach"]){
        return [self maiYellowDarkColor];
    }else if ([sectionSt isEqualToString:@"Dry"]){
        return [self maiGreenColor];
    }else if ([sectionSt isEqualToString:@"Wring"]){
        return [self maiPinkColor];
    }else if ([sectionSt isEqualToString:@"Iron"]){
        return [self maiYellowLigthColor];
    }else if ([sectionSt isEqualToString:@"DryClean"]){
        return [self maiBlueDarkColor];
    }
    
    return [UIColor whiteColor];
}



@end
