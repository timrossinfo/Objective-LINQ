//
//  LNQQueryOperator.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 15/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^LNQProjectionBlock)(id);
typedef BOOL (^LNQRestrictionBlock)(id);

@protocol LNQQueryOperator <NSObject>

@end
