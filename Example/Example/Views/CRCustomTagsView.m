//
//  CRCustomTagsView.m
//  Example
//
//  Created by Lcrnice on 2016/11/12.
//  Copyright © 2016年 Lcrnice. All rights reserved.
//

#import "CRCustomTagsView.h"
#import <Masonry/Masonry.h>
#import "CRModel.h"

@interface CRCustomTagsView ()

@property (nonatomic) UIImageView *leftPointImgV;

@end


@implementation CRCustomTagsView

#pragma mark - init views 💧
- (instancetype)initWithAlignment:(NSTextAlignment)alignment {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self setupCustomTagsView:alignment];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupCustomTagsView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupCustomTagsView];
}
#pragma mark - setup UI
- (void)setupCustomTagsView {
    [self setupCustomTagsView:NSTextAlignmentLeft];
}
- (void)setupCustomTagsView:(NSTextAlignment)alignment {
//    self.layer.borderColor = [UIColor blackColor].CGColor;
//    self.layer.borderWidth = .5;

//    self.label.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.label.layer.borderWidth = .5;
    
    self.cr_backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
    self.alignment = alignment;
    self.itemHeight = 22;
    self.lineSpacing = 5;
    self.interItemSpacing = 5;
    self.textHeadIndent = 7;
    self.itemFont = 13;
    self.itemInnerSpacing = 25;
    
    UIImageView *imageView = [UIImageView new];
    imageView.backgroundColor = [UIColor blueColor];
    imageView.layer.cornerRadius = 2;
    imageView.clipsToBounds = YES;
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.label);
        make.left.equalTo(self.label).offset(8);
        make.size.mas_equalTo(CGSizeMake(5, 5));
    }];
    self.leftPointImgV = imageView;
}

#pragma mark - override
- (void)setupTagsViewWithModel:(id)model {
    CRModel *tag = (CRModel *)model;
    NSString *title = tag.title;
    UIColor *color = tag.color;
    NSNumber *enabled = tag.enabled;
    color = enabled.boolValue == YES ? color : [UIColor lightGrayColor];
    
    self.label.attributedText = [self cr_attributedString:title];
    self.label.backgroundColor = color;
    self.leftPointImgV.backgroundColor = [UIColor whiteColor];
}

@end
