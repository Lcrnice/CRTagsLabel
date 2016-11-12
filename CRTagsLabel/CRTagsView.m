//
//  CRTagsView.m
//  TestDemo
//
//  Created by Lcrnice on 16/11/9.
//  Copyright © 2016年 Easylive. All rights reserved.
//

#import "CRTagsView.h"

@implementation CRTagsView

#pragma mark - init views 💧
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupTagsView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupTagsView];
}

- (void)setupTagsView {
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.height.greaterThanOrEqualTo(@(0));
        make.left.equalTo(@(0));
        make.right.equalTo(@(0));
    }];
}

#pragma mark - public methods
- (NSAttributedString *)attributedStringWithTags:(NSArray *)tags {
    UITableViewCell *cell = [UITableViewCell new];
    
    NSMutableAttributedString *mutableString = [NSMutableAttributedString new];
    for (NSInteger i = 0; i < tags.count; i++) {
        CRTagsView *view = [self tagsViewOfSubclass];
        
        [view setupTagsViewWithModel:tags[i]];
        
        CGSize size = [view systemLayoutSizeFittingSize:view.frame.size
                          withHorizontalFittingPriority:UILayoutPriorityFittingSizeLevel
                                verticalFittingPriority:UILayoutPriorityFittingSizeLevel];
        view.frame = CGRectMake(0, 0, size.width + self.itemInnerSpacing, size.height);
        [cell.contentView addSubview:view];
        
        // Note: 如果不更新 view 的约束，iOS 8会显示空白
        [view layoutIfNeeded];
        
        UIImage *image = view.image;
        NSTextAttachment *attachment = [NSTextAttachment new];
        attachment.image = image;
        
        NSAttributedString *attrStr = [NSAttributedString attributedStringWithAttachment:attachment];
        [mutableString beginEditing];
        [mutableString appendAttributedString:attrStr];
        [mutableString endEditing];
    }
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = self.lineSpacing;
    paragraphStyle.alignment = self.alignment;
    [mutableString beginEditing];
    [mutableString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, mutableString.length)];
    [mutableString endEditing];
    
    return mutableString;
}
- (CRTagsView *)tagsViewOfSubclass {
    NSAssert(YES, @"子类需要重写此方法，返回子类对象");
    return nil;
}
- (void)setupTagsViewWithModel:(id)model {
    NSAssert(YES, @"子类需要重写此方法以赋值");
}

#pragma mark - helper
- (NSAttributedString *)cr_attributedString:(NSString *)string {
    NSMutableParagraphStyle *paragraphStyle =  [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.firstLineHeadIndent = self.textHeadIndent;
    paragraphStyle.headIndent = self.textHeadIndent;
    paragraphStyle.tailIndent = self.textTailIndent;
    
    NSDictionary *attributes = @{
                                 NSParagraphStyleAttributeName  : paragraphStyle,
                                 NSFontAttributeName            : [UIFont boldSystemFontOfSize:self.itemFont]
                                 };
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:string
                                                                         attributes:attributes];
    return attributedText;
}

#pragma mark - setter
- (void)setInterItemSpacing:(CGFloat)interItemSpacing {
    _interItemSpacing = interItemSpacing;
    
    CGFloat interSpacing = self.interItemSpacing/2.f;
    
    [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(interSpacing));
        make.right.equalTo(@(-interSpacing));
    }];
}
- (void)setItemHeight:(CGFloat)itemHeight {
    _itemHeight = itemHeight;
    
    self.label.layer.cornerRadius = itemHeight / 2.f;
    [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.greaterThanOrEqualTo(@(itemHeight));
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

#pragma mark - getter 💤
- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.textColor = [UIColor whiteColor];
        _label.translatesAutoresizingMaskIntoConstraints = NO;
        _label.layer.masksToBounds = YES;
    }
    return _label;
}
- (UIImage *)image {
    UIGraphicsBeginImageContextWithOptions(self.frame.size, YES, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
