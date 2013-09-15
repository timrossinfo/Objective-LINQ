//
//  LNQQuery.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 14/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQQuery.h"
#import "LNQSortDescriptor.h"
#import "NSArray+LNQAdditions.h"

@interface LNQQuery()

@property (nonatomic, strong) NSArray *inputArray;
@property (nonatomic, strong) NSMutableArray *operators;

@end

@implementation LNQQuery

- (id)initWithArray:(NSArray *)array {
    if ((self = [super init])) {
        _inputArray = [array copy];
        _operators = [NSMutableArray array];
    }
    return self;
}

- (id<LNQQuery> (^)(LNQProjectionBlock))select {
    return ^id<LNQQuery> (LNQProjectionBlock projectionBlock) {
        [_operators addObject:[[LNQProjection alloc] initWithBlock:projectionBlock]];
        return self;
    };
}

- (id<LNQQuery> (^)(LNQFilterBlock))where {
    return ^id<LNQQuery> (LNQFilterBlock filterBlock) {
        [_operators addObject:[[LNQFilter alloc] initWithBlock:filterBlock]];
        return self;
    };
}

- (id<LNQQuery> (^)(NSString *))orderBy {
    return ^id<LNQQuery> (NSString *key) {
        [_operators addObject:[[LNQSortDescriptor alloc] initWithKey:key descending:NO]];
        return self;
    };
}

- (id<LNQQuery> (^)(NSString *))orderByDescending {
    return ^id<LNQQuery> (NSString *key) {
        [_operators addObject:[[LNQSortDescriptor alloc] initWithKey:key descending:YES]];
        return self;
    };
}

- (NSArray *)executeQuery {
    NSArray *result = [NSArray arrayWithArray:_inputArray];
    for (id<LNQQueryOperator> operator in _operators) {
        if ([operator isKindOfClass:[LNQProjection class]]) {
            LNQProjection *projection = (LNQProjection *)operator;
            result = [result LNQ_mappedArrayUsingProjection:projection];
        } else if ([operator isKindOfClass:[LNQFilter class]]) {
            LNQFilter *filter = (LNQFilter *)operator;
            result = [result LNQ_filteredArrayUsingFilter:filter];
        } else if ([operator isKindOfClass:[LNQSortDescriptor class]]) {
            LNQSortDescriptor *sortDescriptor = (LNQSortDescriptor *)operator;
            result = [result LNQ_sortedArrayUsingDescriptor:sortDescriptor];
        }
    }
    return [result copy];
}

- (NSArray *(^)())toArray {
    return ^() {
        return [self executeQuery];
    };
}

- (id (^)())single {
    return ^() {
        return [[self executeQuery] lastObject];
    };
}

@end
