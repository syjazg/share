//
//  Person.h
//  CollectionTest
//
//  Created by 孙雨晶 on 16/4/7.
//  Copyright © 2016年 孙雨晶. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCopying>

@property(nonatomic, copy) NSString* firstName;
@property(nonatomic, copy) NSString* lastName;
@property(nonatomic, copy) NSString* address;

- (instancetype)initWithFirstName:(NSString *) firstName lastName:(NSString *)lastName address:(NSString *)address;

@end
