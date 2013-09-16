//
//  LNQSelectMany.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 16/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQSelectMany.h"

@implementation LNQSelectMany

- (id)initWithBlock:(LNQProjectionBlock)block {
    if ((self = [super init])) {
        _block = block;
    }
    return self;
}

@end
