//
//  NSArray+LNQAdditions.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 11/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNQQuery.h"

@interface NSArray (LNQAdditions)

@property (nonatomic, copy, readonly) id<LNQQuery> (^select)(NSString *attr);
@property (nonatomic, copy, readonly) id<LNQWhereClause> (^where)(NSString *attr);

@end
