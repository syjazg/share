//
//  Subject.h
//  CollectionTest
//
//  Created by 孙雨晶 on 16/4/5.
//  Copyright © 2016年 孙雨晶. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subject : NSObject<NSCopying,NSCoding>
/**
 *  科目名
 */
@property(nonatomic,copy) NSString* subjectName;

/**
 *  科目分数
 */
@property(nonatomic,strong) NSNumber* goal;


- (instancetype)initWithSubjectName:(NSString *) subjectName goal:(NSNumber *) goal;

@end
