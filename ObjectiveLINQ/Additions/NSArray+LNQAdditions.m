//
//  NSArray+LNQAdditions.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 11/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "NSArray+LNQAdditions.h"

@implementation NSArray (LNQAdditions)

- (id<LNQQuery> (^)(id))select {
    return ^id<LNQQuery> (id attr) {
        return [[LNQQuery alloc] initWithArray:self].select(attr);
    };
}

- (id<LNQWhereClause> (^)(id))where {
    return ^id<LNQWhereClause>(id attr) {
        return [[LNQQuery alloc] initWithArray:self].where(attr);
    };
}

@end
