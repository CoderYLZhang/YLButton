# YLButton

通过下面的枚举设置button的图片位置

```
typedef NS_ENUM(NSUInteger, YLImageAlignment) {
    YLImageAlignmentLeft,
    YLImageAlignmentRight,
    YLImageAlignmentTop,
    YLImageAlignmentBottom
};
```

通过这两个属性设置偏移

```
@property(nonatomic,assign) UIEdgeInsets yl_imageInsets;

@property(nonatomic,assign) UIEdgeInsets yl_titleInsets;
```