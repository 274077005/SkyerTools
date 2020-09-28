//
//  Tools.m
//  NotebookApp
//
//  Created by 滕应伟 on 2020/6/12.
//  Copyright © 2020 滕应伟. All rights reserved.
//

#import "Tools.h"

@implementation Tools


+ (void) reloadSimpleData:(id)simpleData key:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setValue:simpleData forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id) getSimpleData : (NSString *)key {
    id simpleData = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    return simpleData;
}

+ (id) getSimpleDataNotNil : (NSString *)key {
    id simpleData = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    return simpleData ? simpleData : @"";
}

+ (id) getSimpleStrDataNotNil : (NSString *)key {
    id simpleData = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    if (simpleData == nil) return @"";
    NSString *simpleDataStr = [NSString stringWithFormat:@"%@", simpleData];
    return simpleDataStr ? simpleDataStr : @"";
}


+ (NSString *)dateFormatWithDate:(NSDate *)data format:(NSString *)format {
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:data];
}

@end
