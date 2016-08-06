//
//  LAOpenWeather.m
//  weatherDemo
//
//  Created by 刘安海 on 16/8/5.
//  Copyright © 2016年 刘安海. All rights reserved.
//

#import "LAOpenWeather.h"

@implementation LAOpenWeather

- (NSString *)description {
    //    return [NSString stringWithFormat:@"currentCity = %@ pm25 = %@
    //    weather_data = %@",_currentCity,_pm25,_weather_data];
    
    return [NSString stringWithFormat:@"temp = %@ temp_min = %@  temp_max = %@",
            _temp, _temp_min, _temp_max];
}


@end
