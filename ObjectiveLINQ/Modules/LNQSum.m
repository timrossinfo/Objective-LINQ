//
//  LNQSum.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 16/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQSum.h"

@implementation LNQSum

- (id)initWithBlock:(LNQNumericBlock)block {
    if ((self = [super init])) {
        _block = block;
    }
    return self;
}

@end
