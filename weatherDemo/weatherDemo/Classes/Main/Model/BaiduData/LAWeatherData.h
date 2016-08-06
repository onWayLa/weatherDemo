//
//  LAWeatherData.h
//  weatherDemo
//
//  Created by 刘安海 on 16/8/4.
//  Copyright © 2016年 刘安海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LAWeatherData : NSObject

/***  百度天气数据   */

@property(nonatomic, copy) NSString *currentCity;

@property(nonatomic, copy) NSString *pm25;

@property(nonatomic, strong) NSArray *weather_data;

/***  openWeather天气数据   */

@property(nonatomic, copy) NSDictionary *main;

@property(nonatomic, copy) NSArray *weather;

@property(nonatomic, strong) NSDate *dt_text;

@end
