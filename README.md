# CRTagsLabel

📌[CRTagsLabel](https://github.com/Lcrnice/CRTagsLabel) generated tag by the attributedText.  

## Preview
You're probably curious how it looks. Here you are:
![CRTagsLabel_Gif](http://ww1.sinaimg.cn/large/006y8lVajw1f9pqam7eqjg30aa0ic1kx.gif)

## Usage  

Create a subclass of `CRTagsView` to dispay tag , override `-setupTagsViewWithModel:` to set model.  
```obj-c
- (void)setupTagsViewWithModel:(id)model {
    CRModel *tag = (CRModel *)model;
    NSString *title = tag.title;
    
    self.label.attributedText = [self cr_attributedString:title];
}
```

Create `CRTagsLabel` in UIViewController, config `block` and `tags`.
```obj-c
NSAttributedString *(^block)() = ^NSAttributedString *() {
    CRCustomTagsView *customTagView = [[CRCustomTagsView alloc] initWithAlignment:self.alignment];

    return [customTagView attributedStringWithTags:tags];
};
    
CRTagsLabel *tagsLabel = [[CRTagsLabel alloc] initWithBlock:block];
tagsLabel.tags = tags;
tagsLabel.delegate = self;
[self.view addSubview:tagsLabel];
[tagsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(@100);
    make.left.equalTo(@10);
    make.right.equalTo(@-10);
}];
```

## TODO
* add to CocoaPods

## Contributing

Issues and pull requests are welcome!

## Author

Lcrnice [@Lcrnice](https://twitter.com/Lcrnice)

## License

CRTagsLabel is released under an MIT license. See LICENSE for more information.
