//
//  LNQQuery.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 14/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQQuery.h"
#import "LNQOperator.h"

@interface LNQQuery()

@property (nonatomic, strong) NSArray *inputArray;
@property (nonatomic, strong) NSMutableArray *operators;

- (NSArray *)arrayByMappingArray:(NSArray *)array usingBlock:(LNQOperatorBlock)block;

@end

@implementation LNQQuery

- (id)initWithArray:(NSArray *)array {
    if ((self = [super init])) {
        _inputArray = [array copy];
        _operators = [NSMutableArray array];
    }
    return self;
}

- (id<LNQQuery> (^)(id))select {
    return ^id<LNQQuery> (id attr) {
        [_operators addObject:[[LNQOperator alloc] initWithType:LNQOperatorTypeSelect value:attr]];
        return self;
    };
}

- (id<LNQWhereClause> (^)(id))where {
    return ^id<LNQWhereClause> (id attr) {
        [_operators addObject:[[LNQOperator alloc] initWithType:LNQOperatorTypeWhere value:attr]];
        return self;
    };
}

- (id<LNQQuery, LNQWhereClause> (^)(id))equalTo {
    return ^id<LNQQuery, LNQWhereClause> (id value) {
        [_operators addObject:[[LNQOperator alloc] initWithType:LNQOperatorTypeEqualTo value:value]];
        return self;
    };
}

- (id<LNQWhereClause> (^)(id))and {
    return ^id<LNQWhereClause> (NSString * attr) {
        [_operators addObject:[[LNQOperator alloc] initWithType:LNQOperatorTypeAnd value:attr]];
        return self;
    };
}

- (NSArray *)executeQuery {
    NSArray *result = [NSArray arrayWithArray:_inputArray];
    id whereAttr = nil;
    for (LNQOperator *operator in _operators) {
        switch (operator.type) {
            case LNQOperatorTypeSelect: {
                if ([operator.value isKindOfClass:[NSString class]]) {
                    result = [result valueForKeyPath:operator.value];
                } else {
                    LNQOperatorBlock operatorBlock = (LNQOperatorBlock)operator.value;
                    result = [self arrayByMappingArray:result usingBlock:operatorBlock];
                }
                break;
            }
            case LNQOperatorTypeWhere:
            case LNQOperatorTypeAnd:
                whereAttr = operator.value;
                break;
            case LNQOperatorTypeEqualTo: {
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(%K == %@)", whereAttr, operator.value];
                result = [result filteredArrayUsingPredicate:predicate];
                break;
            }
            default:
                break;
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

- (NSArray *)arrayByMappingArray:(NSArray *)array usingBlock:(LNQOperatorBlock)block {
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:array.count];
    for (id obj in array) {
        [arr addObject:block(obj)];
    }
    return [arr copy];
}

@end
