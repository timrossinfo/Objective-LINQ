//
//  LNQRestriction.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 15/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNQQueryOperator.h"

@interface LNQWhere : NSObject<LNQQueryOperator>

@property (nonatomic, copy, readonly) LNQRestrictionBlock block;

- (id)initWithBlock:(LNQRestrictionBlock)block;

@end
