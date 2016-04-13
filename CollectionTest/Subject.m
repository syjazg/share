//
//  Subject.m
//  CollectionTest
//
//  Created by 孙雨晶 on 16/4/5.
//  Copyright © 2016年 孙雨晶. All rights reserved.
//

#import "Subject.h"

@implementation Subject

- (instancetype)init{
    return [self initWithSubjectName:nil goal:nil];
}

- (instancetype)initWithSubjectName:(NSString *)subjectName goal:(NSNumber *)goal{
    self = [super init];
    if (self) {
        self.subjectName = subjectName;
        self.goal = goal;
    }
    return self;
}

- (id)copyWithZone:(nullable NSZone *)zone{
    return [[self.class allocWithZone:zone] initWithSubjectName:self.subjectName goal:self.goal];
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.subjectName forKey:@"subjectName"];
    [aCoder encodeObject:self.goal forKey:@"goal"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.subjectName = [aDecoder decodeObjectForKey:@"subjectName"];
        self.goal = [aDecoder decodeObjectForKey:@"goal"];
    }
    return self;
}

@end
