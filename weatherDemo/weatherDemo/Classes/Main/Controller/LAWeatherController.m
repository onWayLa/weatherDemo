//
//  LAWeatherController.m
//  weatherDemo
//
//  Created by 刘安海 on 16/8/4.
//  Copyright © 2016年 刘安海. All rights reserved.
//

#import "LAWeatherController.h"
#import "LAWeatherView.h"

#define kSize self.view.bounds.size

@interface LAWeatherController () <UIScrollViewDelegate, UITableViewDelegate,
                                   UITableViewDataSource>

@property(nonatomic, weak) UIImageView *imageView;

@property(nonatomic, strong) UIVisualEffectView *effectView;

@property(nonatomic, weak) LAWeatherView *weatherView;

@end

@implementation LAWeatherController

- (void)loadView {
  [super loadView];
  UIImageView *imageView =
      [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  _imageView = imageView;
  [self.view addSubview:imageView];

  LAWeatherView *weatherView =
      [[LAWeatherView alloc] initWithFrame:self.view.bounds];
  _weatherView = weatherView;
  [self.view addSubview:weatherView];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  [self setUpChildView];
}

- (void)setUpChildView {

  /**
   *  imageView      UIBlurEffectStyleDark   UIBlurEffectStyleLight
   * UIBlurEffectStyleExtraLight
   */

  self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
  [self.imageView setImage:[UIImage imageNamed:@"bg"]];

  UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];

  UIVisualEffectView *effectView =
      [[UIVisualEffectView alloc] initWithEffect:blur];

  effectView.frame = self.imageView.bounds;
  effectView.autoresizingMask = UIViewAutoresizingFlexibleWidth;

  effectView.alpha = 0;

  _effectView = effectView;

  [self.imageView addSubview:effectView];

  /**
   *  weatherView
   */
  self.weatherView.delegate = self;
  self.weatherView.hourlyView.delegate = self;
  self.weatherView.hourlyView.dataSource = self;
  self.weatherView.DailyView.delegate = self;
  self.weatherView.DailyView.dataSource = self;

  self.weatherView.backgroundColor = [UIColor clearColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"----------");
}

#pragma mark---scrollView的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  CGFloat alph = scrollView.contentOffset.y / kSize.height;
  if (alph > 0.6) {
    alph = 0.6;
  }
  self.effectView.alpha = alph;
}

#pragma mark---tableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {

  if ([tableView isEqual:self.weatherView.hourlyView]) {

    return 3;
  }

  return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *ID = @"cell";

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

  if (cell == nil) {

    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:ID];
  }
  cell.backgroundColor = [UIColor redColor];
  return cell;
}
- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}

@end
