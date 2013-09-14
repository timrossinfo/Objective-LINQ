//
//  NSArray+LNQAdditions.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 11/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "NSArray+LNQAdditions.h"

@implementation NSArray (LNQAdditions)

- (LNQQuery *(^)(id))select {
    return ^id(id attr) {
        LNQQuery *query = [[LNQQuery alloc] initWithArray:self];
        return query.select(attr);
    };
}

@end
