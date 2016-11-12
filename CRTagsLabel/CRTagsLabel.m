//
//  CRTagsLabel.m
//  TestDemo
//
//  Created by Lcrnice on 16/11/9.
//  Copyright © 2016年 Easylive. All rights reserved.
//

#import "CRTagsLabel.h"

@interface CRTagsLabel ()

@end

@implementation CRTagsLabel {
    CGFloat currentHeight;
}

#pragma mark - init views 💧

- (instancetype)initWithBlock:(NSAttributedString *(^)())block {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.updateTags = block;
        [self setupTagsLabel];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupTagsLabel];
}

- (void)setupTagsLabel {
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.textAlignment = NSTextAlignmentLeft;
    self.userInteractionEnabled = YES;
    
    [self addGestureRecognizer:({
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        
        tap;
    })];
}

#pragma mark - layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat height = self.frame.size.height;
    if (height == currentHeight) {
        return;
    }
    currentHeight = height;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tagsLabel:updateHeight:)]) {
        [self.delegate tagsLabel:self updateHeight:height];
    }
}

#pragma mark - actions
- (void)tap:(UITapGestureRecognizer *)recognizer {
    UILabel *label = (UILabel *)recognizer.view;
    CGSize labelSize = recognizer.view.bounds.size;
    
    NSTextContainer *container = [[NSTextContainer alloc] initWithSize:labelSize];
    container.lineFragmentPadding = 0.0f;
    container.lineBreakMode = label.lineBreakMode;
    container.maximumNumberOfLines = label.numberOfLines;
    
    NSLayoutManager *manager = [NSLayoutManager new];
    [manager addTextContainer:container];
    
    NSTextStorage *storage = [[NSTextStorage alloc] initWithAttributedString:label.attributedText];
    [storage addLayoutManager:manager];
    
    CGPoint touchPoint = [recognizer locationInView:label];
    NSInteger indexOfCharacter = [manager characterIndexForPoint:touchPoint inTextContainer:container fractionOfDistanceBetweenInsertionPoints:nil];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tagsLabel:didClickedWordAtIndex:)]) {
        [self.delegate tagsLabel:self didClickedWordAtIndex:indexOfCharacter];
    }
}


#pragma mark - getter / setter
- (void)setTags:(NSArray *)tags {
    _tags = tags;
    
    if (self.updateTags) {
        self.attributedText = self.updateTags();
    }
}


@end
