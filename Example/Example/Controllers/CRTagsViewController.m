//
//  CRTagsViewController.m
//  Example
//
//  Created by Lcrnice on 2016/11/12.
//  Copyright © 2016年 Lcrnice. All rights reserved.
//

#import "CRTagsViewController.h"
#import "CRTagsLabel.h"
#import <Masonry/Masonry.h>
#import "CRCustomTagsView.h"
#import "CRModel.h"

@interface CRTagsViewController () <TagsLabelDelegate>

@end

@implementation CRTagsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
    [self configTagsLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - config UI
- (void)configTagsLabel {
    NSArray *tags = [CRModel tagsOfRandom];
    
    // create the block to generate NSAttributedString
    NSAttributedString *(^block)() = ^NSAttributedString *() {
        CRCustomTagsView *customTagView = [[CRCustomTagsView alloc] initWithAlignment:self.alignment];
        
        return [customTagView attributedStringWithTags:tags];
    };
    
    CRTagsLabel *tagsLabel = [[CRTagsLabel alloc] initWithBlock:block];
    tagsLabel.backgroundColor = self.view.backgroundColor;
    tagsLabel.tags = tags;
    tagsLabel.delegate = self;
    [self.view addSubview:tagsLabel];
    [tagsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@100);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
    }];
}

#pragma mark - TagsLabelDelegate
- (void)tagsLabel:(CRTagsLabel *)label didClickedWordAtIndex:(NSInteger)index {
    NSLog(@"click index = %ld", index);
    
    CRModel *tag = label.tags[index];
    NSNumber *enabled = tag.enabled;
    tag.enabled = [NSNumber numberWithBool:!enabled.boolValue];
    [label setTags:label.tags];
}

- (void)tagsLabel:(CRTagsLabel *)label updateHeight:(CGFloat)height {
    NSLog(@"update height = %.2f", height);
}

@end
