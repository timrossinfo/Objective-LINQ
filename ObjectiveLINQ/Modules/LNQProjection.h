//
//  LNQProjection.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 15/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNQQueryOperator.h"

typedef id (^LNQProjectionBlock)(id);

@interface LNQProjection : NSObject<LNQQueryOperator>

@property (nonatomic, copy, readonly) LNQProjectionBlock block;

- (id)initWithBlock:(LNQProjectionBlock)block;

@end
