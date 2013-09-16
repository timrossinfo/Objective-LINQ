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

- (id<LNQQuery> (^)(LNQRestrictionBlock))where {
    return ^id<LNQQuery>(LNQRestrictionBlock restrictionBlock) {
        return [[LNQQuery alloc] initWithArray:self].where(restrictionBlock);
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

- (NSArray *)LNQ_filteredArrayUsingRestriction:(LNQRestriction *)restriction {
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        if (restriction.block(obj)) {
            [arr addObject:obj];
        }
    }
    return [arr copy];
}

- (NSArray *)LNQ_sortedArrayUsingOrdering:(LNQOrdering *)ordering {
    return [self sortedArrayUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:ordering.key
                                                                           ascending:!ordering.descending]]];
}

@end
