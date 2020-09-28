//
//  Tools.h
//  NotebookApp
//
//  Created by 滕应伟 on 2020/6/12.
//  Copyright © 2020 滕应伟. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tools : NSObject

+ (void) reloadSimpleData:(id)simpleData key:(NSString *)key;
+ (id) getSimpleData:(NSString *)key;
+ (id) getSimpleDataNotNil : (NSString *)key;
+ (id) getSimpleStrDataNotNil : (NSString *)key;


+ (NSString *)dateFormatWithDate:(NSDate *)data format:(NSString *)format;

@end

NS_ASSUME_NONNULL_END
