//
//  LNQFilter.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 15/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQFilter.h"

@implementation LNQFilter

- (id)initWithBlock:(LNQFilterBlock)block {
    if ((self = [super init])) {
        _block = block;
    }
    return self;
}

@end
