//
//  NSArray+LNQAdditions.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 11/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "NSArray+LNQAdditions.h"

@implementation NSArray (LNQAdditions)

- (id<LNQQuery> (^)(LNQProjectionBlock))select {
    return ^id<LNQQuery> (LNQProjectionBlock projectionBlock) {
        return [[LNQQuery alloc] initWithArray:self].select(projectionBlock);
    };
}

- (id<LNQQuery> (^)(LNQFilterBlock))where {
    return ^id<LNQQuery>(LNQFilterBlock filterBlock) {
        return [[LNQQuery alloc] initWithArray:self].where(filterBlock);
    };
}

- (NSArray *)arrayByMappingArrayUsingProjectionBlock:(LNQProjectionBlock)projectionBlock {
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        [arr addObject:projectionBlock(obj)];
    }
    return [arr copy];
}

- (NSArray *)arrayByFilteringArrayUsingFilterBlock:(LNQFilterBlock)filterBlock {
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        if (filterBlock(obj)) {
            [arr addObject:obj];
        }
    }
    return [arr copy];
}

@end
