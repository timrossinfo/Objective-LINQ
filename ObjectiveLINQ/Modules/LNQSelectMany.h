//
//  LNQSelectMany.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 16/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNQQueryOperator.h"

@interface LNQSelectMany : NSObject<LNQQueryOperator>

@property (nonatomic, copy, readonly) LNQProjectionBlock block;

- (id)initWithBlock:(LNQProjectionBlock)block;

@end