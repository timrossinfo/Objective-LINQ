//
//  NSArray+LNQAdditions.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 11/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "NSArray+LNQAdditions.h"

@implementation NSArray (LNQAdditions)

- (id<LNQQuery> (^)(NSString *))select {
    return ^id<LNQQuery> (NSString *attr) {
        return [[LNQQuery alloc] initWithArray:self].select(attr);
    };
}

- (id<LNQWhereClause> (^)(NSString *))where {
    return ^id<LNQWhereClause>(NSString *attr) {
        return [[LNQQuery alloc] initWithArray:self].where(attr);
    };
}

@end
