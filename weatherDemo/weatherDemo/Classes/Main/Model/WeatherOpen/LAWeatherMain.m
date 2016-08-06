//
//  LAWeatherMain.m
//  weatherDemo
//
//  Created by 刘安海 on 16/8/5.
//  Copyright © 2016年 刘安海. All rights reserved.
//

#import "LAWeatherMain.h"

@implementation LAWeatherMain
- (NSString *)description {
    //    return [NSString stringWithFormat:@"currentCity = %@ pm25 = %@
    //    weather_data = %@",_currentCity,_pm25,_weather_data];
    
    return [NSString stringWithFormat:@"main = %@ ",
            _main];
}
@end
