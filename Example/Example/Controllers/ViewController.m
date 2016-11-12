//
//  ViewController.m
//  Example
//
//  Created by Lcrnice on 2016/11/10.
//  Copyright © 2016年 Lcrnice. All rights reserved.
//

#import "ViewController.h"
#import "CRTagsViewController.h"

static NSString * const identifierOfTags = @"tagsVC";

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:identifierOfTags]) {
        CRTagsViewController *tagsVC = segue.destinationViewController;
        UITableViewCell *cell = sender;
        NSInteger index = [self.dataArray indexOfObject:cell.textLabel.text];
        tagsVC.alignment = (NSTextAlignment)index;
    }
}

#pragma mark - getters
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"AlignmentLeft",
                       @"AlignmentCenter",
                       @"AlignmentRight",
                       @"AlignmentJustified",
                       @"AlignmentNatural"];
    }
    return _dataArray;
}

@end
