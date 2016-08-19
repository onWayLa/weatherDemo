//
//  Single.h
//  单例
//
//  Created by 刘安海 on 16/4/27.
//  Copyright (c) 2016年 刘安海. All rights reserved.
//

#define Single_h(name) +(instancetype)shared##name

#define Single_m(name)                                                         \
  static id _instance;                                                         \
                                                                               \
  +(instancetype)shared##name {                                                \
    static dispatch_once_t onceToken;                                          \
    dispatch_once(&onceToken, ^{                                               \
      _instance = [[self alloc] init];                                         \
    });                                                                        \
    return _instance;                                                          \
  }                                                                            \
                                                                               \
  +(instancetype)allocWithZone : (struct _NSZone *)zone {                      \
    static dispatch_once_t onceToken;                                          \
    dispatch_once(&onceToken, ^{                                               \
      _instance = [super allocWithZone:zone];                                  \
    });                                                                        \
    return _instance;                                                          \
  }                                                                            \
                                                                               \
  -(instancetype)copyWithZone : (NSZone *)zone {                               \
    return _instance;                                                          \
  }
