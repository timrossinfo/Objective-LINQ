//
//  LNQQuery.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 14/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LNQWhereClause;

@protocol LNQQuery <NSObject>

@property (nonatomic, copy, readonly) id<LNQQuery> (^select)(NSString *attr);
@property (nonatomic, copy, readonly) id<LNQWhereClause> (^where)(NSString *attr);
@property (nonatomic, copy, readonly) NSArray *(^toArray)();
@property (nonatomic, copy, readonly) id<NSObject> (^single)();

@end

@protocol LNQWhereClause <NSObject>

@property (nonatomic, copy, readonly) id<LNQQuery> (^equalTo)(id<NSObject> value);

@end

@interface LNQQuery : NSObject<LNQQuery, LNQWhereClause>

- (id)initWithArray:(NSArray *)array;

@end
