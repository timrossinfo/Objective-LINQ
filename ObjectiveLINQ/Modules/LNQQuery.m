//
//  LNQQuery.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 14/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQQuery.h"
#import "LNQOrdering.h"
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
        [_operators addObject:[[LNQSelect alloc] initWithBlock:projectionBlock]];
        return self;
    };
}

- (id<LNQQuery> (^)(LNQProjectionBlock))selectMany {
    return ^id<LNQQuery> (LNQProjectionBlock projectionBlock) {
        [_operators addObject:[[LNQSelectMany alloc] initWithBlock:projectionBlock]];
        return self;
    };
}

- (id<LNQQuery> (^)(LNQRestrictionBlock))where {
    return ^id<LNQQuery> (LNQRestrictionBlock restrictionBlock) {
        [_operators addObject:[[LNQWhere alloc] initWithBlock:restrictionBlock]];
        return self;
    };
}

- (id<LNQQuery> (^)(NSString *))orderBy {
    return ^id<LNQQuery> (NSString *key) {
        [_operators addObject:[[LNQOrdering alloc] initWithKey:key descending:NO]];
        return self;
    };
}

- (id<LNQQuery> (^)(NSString *))orderByDescending {
    return ^id<LNQQuery> (NSString *key) {
        [_operators addObject:[[LNQOrdering alloc] initWithKey:key descending:YES]];
        return self;
    };
}

- (NSArray *)executeQuery {
    NSArray *result = [NSArray arrayWithArray:_inputArray];
    for (id<LNQQueryOperator> operator in _operators) {
        if ([operator isKindOfClass:[LNQSelect class]]) {
            LNQSelect *select = (LNQSelect *)operator;
            result = [result LNQ_mappedArrayUsingSelect:select];
        } else if ([operator isKindOfClass:[LNQSelectMany class]]) {
            LNQSelectMany *selectMany = (LNQSelectMany *)operator;
            result = [result LNQ_mappedArrayUsingSelectMany:selectMany];
        } else if ([operator isKindOfClass:[LNQWhere class]]) {
            LNQWhere *where = (LNQWhere *)operator;
            result = [result LNQ_filteredArrayUsingWhere:where];
        } else if ([operator isKindOfClass:[LNQOrdering class]]) {
            LNQOrdering *ordering = (LNQOrdering *)operator;
            result = [result LNQ_sortedArrayUsingOrdering:ordering];
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
