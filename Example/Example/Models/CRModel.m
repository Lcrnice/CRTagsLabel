//
//  CRModel.m
//  Example
//
//  Created by Lcrnice on 2016/11/12.
//  Copyright © 2016年 Lcrnice. All rights reserved.
//

#import "CRModel.h"

@implementation CRModel

+ (NSArray *)tagsOfRandom {
    
    NSString *tagString = @"Classical, Comedy, Country, Dance, Drama, Early Listening, Electronic, Folk, Hip Hop/Rap, Holiday";
    
    // Disrupt tags array
    NSMutableArray *arrayMut = [tagString componentsSeparatedByString:@", "].mutableCopy;
    NSMutableArray *tagArray = @[].mutableCopy;
    
    while (arrayMut.count > 0) {
        NSString *tag = [arrayMut objectAtIndex:arc4random() % arrayMut.count];
        [arrayMut removeObject:tag];
        
        CRModel *model = [CRModel new];
        model.title = tag;
        model.color = [self colorOfRandom];
        model.enabled = @(YES);
        [tagArray addObject:model];
    }
    
    return tagArray;
}

+ (UIColor *)colorOfRandom {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

@end
