//
//  ViewController.m
//  CollectionTest
//
//  Created by 孙雨晶 on 16/3/31.
//  Copyright © 2016年 孙雨晶. All rights reserved.
//

#import "ViewController.h"
#import "Subject.h"
#import "Person.h"


@interface ViewController ()

@property(nonatomic, strong) NSArray *testArray;
@property(nonatomic, strong) NSMutableArray *testMutableArray;

@property(nonatomic, strong) NSMutableString *amy;

@property(nonatomic, strong) NSSet *testSet;
@property(nonatomic, strong) NSMutableSet *testMutableSet;

@property(nonatomic, strong) NSDictionary *testDic;
@property(nonatomic, strong) NSMutableDictionary *testMutableDictionary;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCollections];
    
   // [self testArrayCopy];
//    [self testArrayIndexOf];

    
    //Array sort
//    [self testSortedByDescription];
//    [self testSortedByBlocks];
    [self testSortedByFunctionAndSelectors];
    
    
    
    // [self testForDictionaryKey];
    
    
    //Dictionary sort
//    [self testForSortDictionaryBySelectorMethod];
//    [self testForSortDictionaryByBlockMethod];
    
    
    //Set test
//    [self testForSet];
}

- (void)initCollections{
    self.amy = [NSMutableString stringWithString:@"amy"];
    //array
    self.testArray = [NSArray arrayWithObjects:self.amy,@"sally",@"danny",@"black", nil];//语法糖@[...]
    [self testArrayCopy];
    
    //set
    self.testSet = [NSSet setWithObjects:@"amy",@"sally",@"danny",@"black",nil];
    
    //dictionary
    NSString *firstName1 = @"sun";
    NSString *firstName2 = @"zhao";
    self.testDic = [NSDictionary dictionaryWithObjectsAndKeys:@"amy",firstName1,@"sally",firstName2,@"danny",firstName1,@"black",firstName2, nil];
    
}

- (void)testArrayCopy{
//    NSLog(@"%p",self.testArray[0]);
//    self.testMutableArray = [[NSMutableArray alloc] initWithArray:self.testArray copyItems:YES];
//    NSLog(@"%p",self.testMutableArray[0]);
    self.testMutableArray = [NSMutableArray array];
    for (NSUInteger i = 0; i<5; i++) {
        [self.testMutableArray addObject:[[Subject alloc] initWithSubjectName:@"math" goal:@(arc4random()%100)] ];
    }
    NSLog(@"testMutableArray's point is %p, testMutableArray[0]'s point is %p",self.testMutableArray,self.testMutableArray[0]);
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:self.testMutableArray copyItems:YES];
    NSLog(@"newArray's point is %p, newArray[0]'s point is %p",newArray,newArray[0]);
    
    //archive && unarchive
    NSArray* trueDeepCopyArray = [NSKeyedUnarchiver unarchiveObjectWithData:
                                  [NSKeyedArchiver archivedDataWithRootObject:newArray]];
    NSLog(@"trueDeepCopyArray's point is %p, trueDeepCopyArray[0]'s point is %p",trueDeepCopyArray,trueDeepCopyArray[0]);

}

- (void)testArrayIndexOf{
    NSString *amy2 = @"amy";
    [self.testMutableArray addObject:amy2];
    NSLog(@"%@",@([self.testMutableArray indexOfObject:amy2]));
    NSLog(@"%@",@([self.testMutableArray indexOfObjectIdenticalTo:amy2]));
}

//Array sort
- (void)testSortedByDescription{
    NSString *math = @"math";
    NSString *physics = @"physics";
    NSMutableArray *array = [NSMutableArray array];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@(70),math,@(80),physics, nil];
    [array addObject:dictionary];
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@(60),math,@(90),physics, nil];
    [array addObject:dictionary];
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@(70),math,@(66),physics, nil];
    [array addObject:dictionary];
    
    //sort first by math then by physics in an ascending order
    NSSortDescriptor *mathDescription = [NSSortDescriptor sortDescriptorWithKey:math ascending:YES selector:@selector(compare:)];
    NSSortDescriptor *physicsDescription = [NSSortDescriptor sortDescriptorWithKey:physics ascending:YES selector:@selector(compare:)];
    NSArray *sortDescriptionArray = [NSArray arrayWithObjects:mathDescription,physicsDescription, nil];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:sortDescriptionArray];
    NSLog(@"%@",sortedArray);
}

- (void)testSortedByBlocks{
    NSString *math = @"math";
    NSString *physics = @"physics";
    NSMutableArray *array = [NSMutableArray array];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@(70),math,@(80),physics, nil];
    [array addObject:dictionary];
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@(60),math,@(90),physics, nil];
    [array addObject:dictionary];
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@(70),math,@(66),physics, nil];
    [array addObject:dictionary];
    
    NSArray *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary *obj2) {
        NSNumber *goal1 = [obj1 objectForKey:@"math"];
        NSNumber *goal2 = [obj2 objectForKey:@"math"];
        return [goal1 compare:goal2];
    }];
    NSLog(@"%@",sortedArray);
}

NSInteger alphabeticSort(id string1, id string2, void *reverse)
{
    if (*(BOOL *)reverse == YES) {
        return [string2 localizedCaseInsensitiveCompare:string1];
    }
    return [string1 localizedCaseInsensitiveCompare:string2];
}

- (void)testSortedByFunctionAndSelectors{
    NSMutableArray *anArray =
    [NSMutableArray arrayWithObjects:@"aa", @"ab", @"ac", @"ad", @"ae", @"af", @"ag",
     @"ah", @"ai", @"aj", @"ak", @"al", @"am", @"an", @"ao", @"ap", @"aq", @"ar", @"as", @"at",
     @"au", @"av", @"aw", @"ax", @"ay", @"az", @"ba", @"bb", @"bc", @"bd", @"bf", @"bg", @"bh",
     @"bi", @"bj", @"bk", @"bl", @"bm", @"bn", @"bo", @"bp", @"bq", @"br", @"bs", @"bt", @"bu",
     @"bv", @"bw", @"bx", @"by", @"bz", @"ca", @"cb", @"cc", @"cd", @"ce", @"cf", @"cg", @"ch",
     @"ci", @"cj", @"ck", @"cl", @"cm", @"cn", @"co", @"cp", @"cq", @"cr", @"cs", @"ct", @"cu",
     @"cv", @"cw", @"cx", @"cy", @"cz", nil];
    // note: anArray is sorted
    NSData *sortedArrayHint = [anArray sortedArrayHint];
    
    [anArray insertObject:@"be" atIndex:5];
    BOOL reverseSort = YES;
    
    NSArray *sortedArray;
    
    // sort using a selector
    NSLog(@"%@",@"begin");
    sortedArray =
    [anArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSLog(@"%@",sortedArray);
    
    // sort using a function
    //context将作为alphabeticSort的第三个参数，可以为nil
    sortedArray =
    [anArray sortedArrayUsingFunction:alphabeticSort context:&reverseSort];
     NSLog(@"%@",sortedArray);
    
    // sort with a hint
    sortedArray =
    [anArray sortedArrayUsingFunction:alphabeticSort
                              context:&reverseSort
                                 hint:sortedArrayHint];
    NSLog(@"%@",sortedArray);
}

- (void)testForDictionaryKey{
    Subject *subject = [[Subject alloc] initWithSubjectName:@"math" goal:@(90)];
    Person *person = [[Person alloc]initWithFirstName:@"Sun" lastName:@"Mavis" address:@"xxx"];
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:subject,person,nil];
    NSLog(@"dictionary's first key is%lu",(unsigned long)((Person *)[dictionary allKeys][0]).hash);
    NSLog(@"person's hash is %lu",(unsigned long)person.hash);
    
    if ([person isEqual:(Person *)[dictionary allKeys][0]]) {
        subject = [dictionary objectForKey:person];
        NSLog(@"%@",subject);
    }
    
    subject = [dictionary objectForKey:(Person *)[dictionary allKeys][0]];
    NSLog(@"%@",subject);
}

//Dictionary sort
- (void)testForSortDictionaryBySelectorMethod{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSNumber numberWithInt:66],@"math",
                                [NSNumber numberWithInt:33],@"english",
                                [NSNumber numberWithInt:22],@"history",
                                [NSNumber numberWithInt:111],@"geography",
                                nil];
    NSArray *sortedKeysArray = [dictionary keysSortedByValueUsingSelector:@selector(compare:)];
    NSLog(@"%@",sortedKeysArray);
}

- (void)testForSortDictionaryByBlockMethod{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSNumber numberWithInt:66],@"math",
                                [NSNumber numberWithInt:33],@"english",
                                [NSNumber numberWithInt:22],@"history",
                                [NSNumber numberWithInt:111],@"geography",
                                nil];
    NSArray *sortedArray = [dictionary keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSLog(@"%@",sortedArray);
}

- (void)testForSet{
    NSMutableSet *set1 = [[NSMutableSet alloc] initWithObjects:@"mavis", @"jack",@"white", nil];
    NSMutableSet *set2 = [[NSMutableSet alloc] initWithObjects:@"helen",@"sally",@"mavis", nil];
    [set1 unionSet:set2];
    NSLog(@"unionSet is %@",set1);
    [set1 intersectSet:set2];
    NSLog(@"intersectSet is %@",set1);
    [set1 minusSet:set2];
    NSLog(@"minusSet is %@",set1);
}

//- (void)testForEnumeration{
//    //Array
//    for (NSUInteger i = 0; i<self.testArray.count; i++) {
//        id object = self.testArray[i];
//    }
//    
//    //Dictionary
//    NSArray *keys = [self.testDic allKeys];
//    for (NSUInteger i=0; i<keys.count; i++) {
//        id key = keys[i];
//        id object = [self.testDic objectForKey:key];
//    }
//    
//    //Set
//    NSArray *tranArray = [self.testSet allObjects];
//    
//    
//}
//
//- (void)testForFastEnumeration{
//    
//    //Array
//    for(id object in [self.testArray reverseObjectEnumerator]){
//        
//    }
//    
//    //Dictionay
//    for(id key in self.testDic){
//        id object = [self.testDic objectForKey:key];
//    }
//    
//    //Set
//    for(id object in self.testSet) {
//        
//    }
//    
//}
//
//- (void)testForBlockEnumeration{
//    //Array
//    [self.testArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        
//    }];
//    
//    //Dictionary
//    [self.testDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//    }];
//    
//    //Set
//    [self.testSet enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
//        
//    }];
//    
//}

@end
