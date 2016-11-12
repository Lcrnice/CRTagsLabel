//
//  CRTagsLabel.h
//  TestDemo
//
//  Created by Lcrnice on 16/11/9.
//  Copyright © 2016年 Easylive. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TagsLabelDelegate;

@interface CRTagsLabel : UILabel

@property (nonatomic, copy) NSArray *tags;
@property (nonatomic, copy) NSAttributedString *(^updateTags)();    /**< 'updateTags' need to be set before set 'tags' */
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
