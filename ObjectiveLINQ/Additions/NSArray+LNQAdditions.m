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

- (id<LNQQuery> (^)(NSString *))orderBy {
    return ^id<LNQQuery> (NSString *key) {
        return [[LNQQuery alloc] initWithArray:self].orderBy(key);
    };
}

- (id<LNQQuery> (^)(NSString *))orderByDescending {
    return ^id<LNQQuery> (NSString *key) {
        return [[LNQQuery alloc] initWithArray:self].orderByDescending(key);
    };
}

- (NSArray *)LNQ_mappedArrayUsingProjection:(LNQProjection *)projection {
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        [arr addObject:projection.block(obj)];
    }
    return [arr copy];
}

- (NSArray *)LNQ_filteredArrayUsingFilter:(LNQFilter *)filter {
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        if (filter.block(obj)) {
            [arr addObject:obj];
        }
    }
    return [arr copy];
}

- (NSArray *)LNQ_sortedArrayUsingDescriptor:(LNQSortDescriptor *)sortDescriptor {
    return [self sortedArrayUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:sortDescriptor.key
                                                                           ascending:!sortDescriptor.descending]]];
}

@end
