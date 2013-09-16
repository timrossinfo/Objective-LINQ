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
    return ^id<LNQQuery> (LNQProjectionBlock block) {
        return [[LNQQuery alloc] initWithArray:self].select(block);
    };
}

- (id<LNQQuery> (^)(LNQProjectionBlock))selectMany {
    return ^id<LNQQuery> (LNQProjectionBlock block) {
        return [[LNQQuery alloc] initWithArray:self].selectMany(block);
    };
}

- (id<LNQQuery> (^)(LNQRestrictionBlock))where {
    return ^id<LNQQuery>(LNQRestrictionBlock block) {
        return [[LNQQuery alloc] initWithArray:self].where(block);
    };
}

- (NSNumber *(^)(LNQNumericBlock))sum {
    return ^NSNumber *(LNQNumericBlock block) {
        return [[LNQQuery alloc] initWithArray:self].sum(block);
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

#pragma mark -
#pragma mark Helpers

- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [result addObject:block(obj, idx)];
    }];
    return [result copy];
}

- (NSArray *)LNQ_mappedArrayUsingSelect:(LNQSelect *)select {
    NSArray *arr = [self mapObjectsUsingBlock:^id(id obj, NSUInteger idx) {
        return select.block(obj);
    }];
    return arr;
}

- (NSArray *)LNQ_mappedArrayUsingSelectMany:(LNQSelectMany *)selectMany {
    NSArray *arr = [self mapObjectsUsingBlock:^id(id obj, NSUInteger idx) {
        return selectMany.block(obj);
    }];
    return [arr valueForKeyPath:@"@unionOfArrays.self"];
}

- (NSArray *)LNQ_filteredArrayUsingWhere:(LNQWhere *)where {
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        if (where.block(obj)) {
            [arr addObject:obj];
        }
    }
    return [arr copy];
}

- (NSNumber *)LNQ_numberUsingSum:(LNQSum *)sum {
    NSArray *arr = [self mapObjectsUsingBlock:^id(id obj, NSUInteger idx) {
        return sum.block(obj);
    }];
    return [arr valueForKeyPath: @"@sum.self"];
}

- (NSArray *)LNQ_sortedArrayUsingOrdering:(LNQOrdering *)ordering {
    return [self sortedArrayUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:ordering.key
                                                                           ascending:!ordering.descending]]];
}

@end
