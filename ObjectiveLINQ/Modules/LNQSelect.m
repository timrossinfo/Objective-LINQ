//
//  LNQProjection.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 15/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQSelect.h"

@implementation LNQSelect

- (id)initWithBlock:(LNQProjectionBlock)block {
    if ((self = [super init])) {
        _block = block;
    }
    return self;
}

@end
