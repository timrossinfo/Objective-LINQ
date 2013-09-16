//
//  NSArray+LNQAdditions.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 11/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNQQuery.h"
#import "LNQSelect.h"
#import "LNQSelectMany.h"
#import "LNQOrdering.h"

@interface NSArray (LNQAdditions)

@property (nonatomic, copy, readonly) id<LNQQuery> (^select)(LNQProjectionBlock projectionBlock);
@property (nonatomic, copy, readonly) id<LNQQuery> (^selectMany)(LNQProjectionBlock projectionBlock);
@property (nonatomic, copy, readonly) id<LNQQuery> (^where)(LNQRestrictionBlock restrictionBlock);
@property (nonatomic, copy, readonly) id<LNQQuery> (^orderBy)(NSString *key);
@property (nonatomic, copy, readonly) id<LNQQuery> (^orderByDescending)(NSString *key);

- (NSArray *)LNQ_mappedArrayUsingSelect:(LNQSelect *)select;
- (NSArray *)LNQ_mappedArrayUsingSelectMany:(LNQSelectMany *)selectMany;
- (NSArray *)LNQ_filteredArrayUsingWhere:(LNQWhere *)where;
- (NSArray *)LNQ_sortedArrayUsingOrdering:(LNQOrdering *)ordering;

@end
