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
#import "LNQSortDescriptor.h"

@interface NSArray (LNQAdditions)

@property (nonatomic, copy, readonly) id<LNQQuery> (^select)(LNQProjectionBlock projectionBlock);
@property (nonatomic, copy, readonly) id<LNQQuery> (^where)(LNQFilterBlock filterBlock);
@property (nonatomic, copy, readonly) id<LNQQuery> (^orderBy)(NSString *key);
@property (nonatomic, copy, readonly) id<LNQQuery> (^orderByDescending)(NSString *key);

- (NSArray *)LNQ_mappedArrayUsingProjection:(LNQProjection *)projection;
- (NSArray *)LNQ_filteredArrayUsingFilter:(LNQFilter *)filter;
- (NSArray *)LNQ_sortedArrayUsingDescriptor:(LNQSortDescriptor *)sortDescriptor;

@end
