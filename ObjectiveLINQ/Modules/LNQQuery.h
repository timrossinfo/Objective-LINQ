//
//  LNQQuery.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 14/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LNQQuery;

@protocol LNQWhereClause <NSObject>

@property (nonatomic, copy, readonly) id<LNQQuery, LNQWhereClause> (^equalTo)(id value);
@property (nonatomic, copy, readonly) id<LNQWhereClause> (^and)(NSString *attr);

@end

@protocol LNQQuery <NSObject>

@property (nonatomic, copy, readonly) id<LNQQuery> (^select)(NSString *attr);
@property (nonatomic, copy, readonly) id<LNQWhereClause> (^where)(NSString *attr);
@property (nonatomic, copy, readonly) NSArray *(^toArray)();
@property (nonatomic, copy, readonly) id (^single)();

@end

@interface LNQQuery : NSObject<LNQQuery, LNQWhereClause>

- (id)initWithArray:(NSArray *)array;

@end
