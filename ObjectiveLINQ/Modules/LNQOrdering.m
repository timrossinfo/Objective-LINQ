//
//  LNQOrdering.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 15/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQOrdering.h"

@implementation LNQOrdering

- (id)initWithKey:(NSString *)key descending:(BOOL)descending {
    if ((self = [super init])) {
        _key = key;
        _descending = descending;
    }
    return self;
}

@end
