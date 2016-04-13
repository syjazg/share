//
//  Person.m
//  CollectionTest
//
//  Created by 孙雨晶 on 16/4/7.
//  Copyright © 2016年 孙雨晶. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithFirstName:(NSString *) firstName lastName:(NSString *)lastName address:(NSString *)address{
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.address = address;
    }
    return self;
}

- (instancetype)init{
    return [self initWithFirstName:nil lastName:nil address:nil];
}

- (instancetype)copyWithZone:(NSZone *)zone{
    return [[self.class allocWithZone:zone] initWithFirstName:self.firstName lastName:self.lastName address:self.address];
}

- (NSUInteger)hash
{
    return self.firstName.hash ^ self.lastName.hash ^ self.address.hash;
}

//- (BOOL)isEqual:(Person *) person{
////    if([self.firstName isEqual:person.firstName] && [self.lastName isEqual:person.lastName] && [self.address isEqual:person.address]){
////        return YES;
////    }
//    if (self.hash == person.hash) {
//        return YES;
//    }
//    return NO;
//}



@end
