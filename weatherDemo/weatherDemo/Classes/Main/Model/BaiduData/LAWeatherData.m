//
//  LAWeatherData.m
//  weatherDemo
//
//  Created by 刘安海 on 16/8/4.
//  Copyright © 2016年 刘安海. All rights reserved.
//

#import "LADtailData.h"
#import "LAWeatherData.h"
#import "LAWeatherMain.h"
#import <MJExtension/MJExtension.h>
@interface LAWeatherData () <MJKeyValue>

@end

@implementation LAWeatherData

+ (NSDictionary *)mj_objectClassInArray {
  return @{
    @"weather_data" : [LADtailData class],
    @"weather" : [LAWeatherMain class]
  };
}

- (NSString *)description {
  //    return [NSString stringWithFormat:@"currentCity = %@ pm25 = %@
  //    weather_data = %@",_currentCity,_pm25,_weather_data];

  return [NSString stringWithFormat:@"main = %@ weather = %@  dt_text = %@",
                                    _main, _weather, _dt_text];
}

@end
