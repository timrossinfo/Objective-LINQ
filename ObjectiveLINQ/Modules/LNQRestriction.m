//
//  LNQRestriction.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 15/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQRestriction.h"

@implementation LNQRestriction

- (id)initWithBlock:(LNQRestrictionBlock)block {
    if ((self = [super init])) {
        _block = block;
    }
    return self;
}

@end
