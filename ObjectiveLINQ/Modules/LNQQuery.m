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

@end

@implementation LNQQuery

- (id)initWithArray:(NSArray *)array {
    if ((self = [super init])) {
        _inputArray = [array copy];
        _operators = [NSMutableArray array];
    }
    return self;
}

- (id<LNQQuery> (^)(NSString *))select {
    return ^id<LNQQuery> (NSString * attr) {
        [_operators addObject:[[LNQOperator alloc] initWithType:LNQOperatorTypeSelect value:attr]];
        return self;
    };
}

- (id<LNQWhereClause> (^)(NSString *))where {
    return ^id<LNQWhereClause> (NSString * attr) {
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

- (id<LNQWhereClause> (^)(NSString *))and {
    return ^id<LNQWhereClause> (NSString * attr) {
        [_operators addObject:[[LNQOperator alloc] initWithType:LNQOperatorTypeAnd value:attr]];
        return self;
    };
}

- (NSArray *)executeQuery {
    NSArray *result = [NSArray arrayWithArray:_inputArray];
    NSString *whereAttr = nil;
    for (LNQOperator *operator in _operators) {
        switch (operator.type) {
            case LNQOperatorTypeSelect:
                result = [result valueForKeyPath:operator.value];
                break;
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

@end
