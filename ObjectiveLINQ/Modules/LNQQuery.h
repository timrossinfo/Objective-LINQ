//
//  LNQQuery.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 14/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNQQueryOperator.h"
#import "LNQSelect.h"
#import "LNQSelectMany.h"
#import "LNQWhere.h"
#import "LNQSum.h"
#import "LNQOrdering.h"

@protocol LNQQuery <NSObject>

@property (nonatomic, copy, readonly) id<LNQQuery> (^select)(LNQProjectionBlock block);
@property (nonatomic, copy, readonly) id<LNQQuery> (^selectMany)(LNQProjectionBlock block);
@property (nonatomic, copy, readonly) id<LNQQuery> (^where)(LNQRestrictionBlock block);
@property (nonatomic, copy, readonly) NSNumber *(^sum)(LNQNumericBlock block);
@property (nonatomic, copy, readonly) id<LNQQuery> (^orderBy)(NSString *key);
@property (nonatomic, copy, readonly) id<LNQQuery> (^orderByDescending)(NSString *key);
@property (nonatomic, copy, readonly) NSArray *(^toArray)();
@property (nonatomic, copy, readonly) id (^single)();

@end

@interface LNQQuery : NSObject<LNQQuery>

- (id)initWithArray:(NSArray *)array;

@end
