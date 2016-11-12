//
//  CRTagsLabel.h
//  TestDemo
//
//  Created by Lcrnice on 16/11/9.
//  Copyright © 2016年 Easylive. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TagsLabelDelegate;

/** 标签基本视图 */
@interface CRTagsLabel : UILabel

@property (nonatomic, copy) NSArray *tags;
@property (nonatomic, copy) NSAttributedString *(^updateTags)();    /**< 使用 nib 时，updateTags 需要在 tags 之前设置 */
@property (nonatomic, weak) id <TagsLabelDelegate> delegate;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithBlock:(NSAttributedString *(^)())block;

@end


@protocol TagsLabelDelegate <NSObject>
@optional
- (void)tagsLabel:(CRTagsLabel *)label didClickedWordAtIndex:(NSInteger)index;
- (void)tagsLabel:(CRTagsLabel *)label updateHeight:(CGFloat)height;

@end
