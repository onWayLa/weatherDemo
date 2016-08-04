//
//  LAHomeView.m
//  weatherDemo
//
//  Created by 刘安海 on 16/8/4.
//  Copyright © 2016年 刘安海. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import "LAHomeView.h"
#import <Masonry.h>
@interface LAHomeView ()

@end

@implementation LAHomeView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {

    UILabel *cityLabel = [[UILabel alloc] init];
    _cityLabel = cityLabel;
    cityLabel.text = @"北京";
    _cityLabel.textAlignment = NSTextAlignmentCenter;
    [_cityLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:cityLabel];

    UILabel *conditionsLabel = [[UILabel alloc] init];
    _conditionsLabel = conditionsLabel;
    conditionsLabel.text = @"Clean";
    [_conditionsLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:conditionsLabel];

    UIImageView *iconView = [[UIImageView alloc] init];
    _iconView = iconView;
    iconView.image = [UIImage imageNamed:@"weather-clear"];
    [self addSubview:iconView];

    UILabel *tempLabel = [[UILabel alloc] init];
    _tempLabel = tempLabel;
    tempLabel.text = @"0℃";
    tempLabel.font = [UIFont systemFontOfSize:32];
    [_tempLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:tempLabel];

    UILabel *hiloLabel = [[UILabel alloc] init];
    _hiloLabel = hiloLabel;
    hiloLabel.text = @"0℃/0℃";
    [_hiloLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:hiloLabel];

    cityLabel.backgroundColor = [self randomColor];
    conditionsLabel.backgroundColor = [self randomColor];
    iconView.backgroundColor = [self randomColor];
    tempLabel.backgroundColor = [self randomColor];
    hiloLabel.backgroundColor = [self randomColor];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];

  [self.cityLabel makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self).offset(44);
    make.leading.trailing.equalTo(self);
  }];

  [self.hiloLabel makeConstraints:^(MASConstraintMaker *make) {

    make.leading.equalTo(self).offset(20);
    make.bottom.equalTo(self);
    make.height.equalTo(self.iconView);
    make.trailing.equalTo(self).offset(-40);
  }];

  [self.tempLabel makeConstraints:^(MASConstraintMaker *make) {
    make.leading.equalTo(self).offset(20);
    make.bottom.equalTo(self.hiloLabel.top);
    make.height.equalTo(70);
  }];

  [self.iconView makeConstraints:^(MASConstraintMaker *make) {
    make.leading.equalTo(self).offset(20);
    make.bottom.equalTo(self.tempLabel.top);
    make.height.width.equalTo(32);
  }];

  [self.conditionsLabel makeConstraints:^(MASConstraintMaker *make) {

    make.leading.equalTo(self.iconView.trailing);
    make.bottom.equalTo(self.tempLabel.top);
    make.height.equalTo(self.iconView);
    make.trailing.equalTo(self).offset(-40);
  }];
}

- (UIColor *)randomColor {
  // 创建随机色
  CGFloat R = arc4random_uniform(256) / 255.0;
  CGFloat G = arc4random_uniform(256) / 255.0;
  CGFloat B = arc4random_uniform(256) / 255.0;
  return [UIColor colorWithRed:R green:G blue:B alpha:1];
}
@end
