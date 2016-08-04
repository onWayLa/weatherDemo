//
//  LAWeatherView.h
//  weatherDemo
//
//  Created by 刘安海 on 16/8/4.
//  Copyright © 2016年 刘安海. All rights reserved.
//

#import "LAHomeView.h"
#import <UIKit/UIKit.h>
@interface LAWeatherView : UIScrollView

@property(nonatomic, weak) LAHomeView *tempView;

@property(nonatomic, weak) UITableView *hourlyView;

@property(nonatomic, weak) UITableView *DailyView;

@end
