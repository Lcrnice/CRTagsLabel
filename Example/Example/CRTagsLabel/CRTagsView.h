//
//  CRTagsView.h
//  TestDemo
//
//  Created by Lcrnice on 16/11/9.
//  Copyright © 2016年 Easylive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRTagsView : UIView

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, assign) NSTextAlignment alignment;        /**< 对齐方式 */
@property (nonatomic, assign) CGFloat lineSpacing;              /**< 上下 item 间隔 */
@property (nonatomic, assign) CGFloat interItemSpacing;         /**< 左右 item 间隔 */
@property (nonatomic, assign) CGFloat itemHeight;               /**< item 高度 */
@property (nonatomic, assign) CGFloat itemFont;                 /**< item 中字体大小 */
@property (nonatomic, assign) CGFloat textHeadIndent;           /**< item 中头部（左侧）的空隙 */
@property (nonatomic, assign) CGFloat textTailIndent;           /**< item 中尾部（右侧）的空隙 # 与上一属性同时使用会相互抵消 #*/
@property (nonatomic, assign) CGFloat itemInnerSpacing;         /**< 让 item 的宽度比原有宽度更长（+）、短（-） */
@property (nonatomic, strong) UIColor *cr_backgroundColor;      /**< edit backgroundColor */

/** Based the NSAttributedString on'tags' */
- (NSAttributedString *)attributedStringWithTags:(NSArray *)tags;

/* this need be override to set model for subclass */
- (void)setupTagsViewWithModel:(id)model;

/** helper */
- (NSAttributedString *)cr_attributedString:(NSString *)string;

@end
