//
//  LNQOperator.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 14/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^LNQOperatorBlock)(id);

typedef enum LNQOperatorType {
    LNQOperatorTypeSelect,
    LNQOperatorTypeWhere,
    LNQOperatorTypeEqualTo,
    LNQOperatorTypeAnd
} LNQOperatorType;

@interface LNQOperator : NSObject

@property (nonatomic, assign, readonly) LNQOperatorType type;
@property (nonatomic, strong) id value;

- (id)initWithType:(LNQOperatorType)type value:(id)value;

@end
