//
//  NSArray+LNQAdditions.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 11/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "NSArray+LNQAdditions.h"

@implementation NSArray (LNQAdditions)

- (LNQQuery *(^)(NSString *))select {
    return ^LNQQuery *(NSString *attr) {
        return [[LNQQuery alloc] initWithArray:self].select(attr);
    };
}

- (LNQQuery *(^)(NSString *))where {
    return ^LNQQuery *(NSString *attr) {
        return [[LNQQuery alloc] initWithArray:self].where(attr);
    };
}

@end
