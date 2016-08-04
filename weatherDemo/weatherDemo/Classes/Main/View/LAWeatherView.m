//
//  LAWeatherView.m
//  weatherDemo
//
//  Created by 刘安海 on 16/8/4.
//  Copyright © 2016年 刘安海. All rights reserved.
//

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import "LAWeatherView.h"
#import <Masonry.h>

@interface LAWeatherView ()

@end

@implementation LAWeatherView

- (instancetype)initWithFrame:(CGRect)frame {

  self = [super initWithFrame:frame];

  if (self) {

    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.contentSize =
        CGSizeMake(self.bounds.size.width, self.bounds.size.height * 3);
    self.pagingEnabled = YES;
    self.scrollEnabled = YES;

    LAHomeView *tempView = [[LAHomeView alloc] init];
    //    tempView.backgroundColor = [UIColor redColor];
    _tempView = tempView;

    [self addSubview:tempView];

    UITableView *hourlyView = [[UITableView alloc] init];

    hourlyView.backgroundColor = [UIColor clearColor];

    _hourlyView = hourlyView;

    [self addSubview:hourlyView];

    UITableView *DailyView = [[UITableView alloc] init];

    DailyView.backgroundColor = [UIColor clearColor];

    _DailyView = DailyView;

    [self addSubview:DailyView];
  }

  return self;
}

- (void)layoutSubviews {

  [super layoutSubviews];
  //
  //  self.tempView.frame = CGRectMake(0, 0, 375, 667);
  //  self.hourlyView.frame = CGRectMake(0, 667, 375, 667);
  //  self.DailyView.frame = CGRectMake(0, 1334, 375, 667);

  [self.tempView makeConstraints:^(MASConstraintMaker *make) {

    make.leading.top.trailing.width.height.equalTo(self);
    make.bottom.equalTo(self.hourlyView.top);

  }];

  [self.hourlyView makeConstraints:^(MASConstraintMaker *make) {

    make.leading.trailing.width.height.equalTo(self);

    make.top.equalTo(self.tempView.bottom);

    make.bottom.equalTo(self.DailyView.top);

  }];

  [self.DailyView makeConstraints:^(MASConstraintMaker *make) {

    make.leading.trailing.width.height.equalTo(self);
    make.top.equalTo(self.hourlyView.bottom);
    make.bottom.equalTo(self);
  }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"%%%%----------");
}

- (UIColor *)randomColor {
  // 创建随机色
  CGFloat R = arc4random_uniform(256) / 255.0;
  CGFloat G = arc4random_uniform(256) / 255.0;
  CGFloat B = arc4random_uniform(256) / 255.0;
  return [UIColor colorWithRed:R green:G blue:B alpha:1];
}

@end
