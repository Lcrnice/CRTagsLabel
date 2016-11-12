//
//  CRModel.h
//  Example
//
//  Created by Lcrnice on 2016/11/12.
//  Copyright © 2016年 Lcrnice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRModel : NSObject

@property (nonatomic, strong) NSNumber *enabled;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, copy) NSString *title;

+ (NSArray *)tagsOfRandom;

@end
