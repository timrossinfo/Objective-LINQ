//
//  LNQOperator.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 14/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQOperator.h"

@implementation LNQOperator

- (id)initWithType:(LNQOperatorType)type value:(id)value {
    if ((self = [super init])) {
        _type = type;
        _value = value;
    }
    return self;
}

@end
