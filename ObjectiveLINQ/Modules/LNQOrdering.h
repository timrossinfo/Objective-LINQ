//
//  LNQOrdering.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 15/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNQQueryOperator.h"

@interface LNQOrdering : NSObject<LNQQueryOperator>

@property (nonatomic, copy, readonly) NSString *key;
@property (nonatomic, assign, readonly) BOOL descending;

- (id)initWithKey:(NSString *)key descending:(BOOL)descending;

@end
