//
//  LNQQuery.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 14/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQQuery.h"

@interface LNQQuery()

@property (nonatomic, strong) NSArray *internalArray;

@end

@implementation LNQQuery

- (id)initWithArray:(NSArray *)array {
    if ((self = [super init])) {
        _internalArray = [array copy];
    }
    return self;
}

- (LNQQuery *(^)(id))select {
    return ^id(id attr) {
        self.internalArray = [_internalArray valueForKeyPath:attr];
        return self;
    };
}

- (NSArray *(^)())toArray {
    return ^() {
        return [_internalArray copy];
    };
}

@end
