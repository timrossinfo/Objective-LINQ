//
//  LNQFilter.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 15/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNQQueryOperator.h"

typedef BOOL (^LNQFilterBlock)(id);

@interface LNQFilter : NSObject<LNQQueryOperator>

@property (nonatomic, copy, readonly) LNQFilterBlock block;

- (id)initWithBlock:(LNQFilterBlock)block;

@end
