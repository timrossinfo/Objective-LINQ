//
//  LNQQuery.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 14/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNQQuery : NSObject

@property (nonatomic, copy, readonly) LNQQuery *(^select)(NSString *attr);
@property (nonatomic, copy, readonly) LNQQuery *(^where)(NSString *attr);
@property (nonatomic, copy, readonly) LNQQuery *(^equalTo)(id<NSObject> value);
@property (nonatomic, copy, readonly) NSArray *(^toArray)();
@property (nonatomic, copy, readonly) id<NSObject> (^single)();

- (id)initWithArray:(NSArray *)array;

@end
