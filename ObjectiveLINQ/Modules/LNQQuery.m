//
//  LNQQuery.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 14/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQQuery.h"

@interface LNQQuery()

@property (nonatomic, strong) NSArray *inputArray;
@property (nonatomic, copy) NSString *selectAttr;
@property (nonatomic, copy) NSString *whereAttr;
@property (nonatomic, strong) id<NSObject> equalToValue;

@end

@implementation LNQQuery

- (id)initWithArray:(NSArray *)array {
    if ((self = [super init])) {
        _inputArray = [array copy];
    }
    return self;
}

- (id<LNQQuery> (^)(NSString *))select {
    return ^LNQQuery *(NSString * attr) {
        self.selectAttr = attr;
        return self;
    };
}

- (id<LNQWhereClause> (^)(NSString *))where {
    return ^LNQQuery *(NSString * attr) {
        self.whereAttr = attr;
        return self;
    };
}

- (id<LNQQuery> (^)(id<NSObject>))equalTo {
    return ^LNQQuery *(id<NSObject> value) {
        self.equalToValue = value;
        return self;
    };
}

- (NSArray *)executeQuery {
    NSArray *result = [NSArray arrayWithArray:_inputArray];
    if (_selectAttr) {
        result = [result valueForKeyPath:_selectAttr];
    }
    if (_whereAttr) {
        if (_equalToValue) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(%K == %@)", _whereAttr, _equalToValue];
            NSLog(@"Predicate: %@", predicate);
            result = [result filteredArrayUsingPredicate:predicate];
        }
    }
    NSLog(@"result: %@", result);
    return [result copy];
}

- (NSArray *(^)())toArray {
    return ^() {
        return [self executeQuery];
    };
}

- (id<NSObject> (^)())single {
    return ^() {
        return [[self executeQuery] lastObject];
    };
}

@end
