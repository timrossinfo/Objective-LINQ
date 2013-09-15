//
//  NSArray+LNQAdditions.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 11/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNQQuery.h"
#import "LNQProjection.h"

@interface NSArray (LNQAdditions)

@property (nonatomic, copy, readonly) id<LNQQuery> (^select)(LNQProjectionBlock projectionBlock);
@property (nonatomic, copy, readonly) id<LNQQuery> (^where)(LNQFilterBlock filterBlock);

- (NSArray *)arrayByMappingArrayUsingProjectionBlock:(LNQProjectionBlock)projectionBlock;
- (NSArray *)arrayByFilteringArrayUsingFilterBlock:(LNQFilterBlock)filterBlock;

@end
