//
//  LNQQuery.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 14/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNQQuery : NSObject

@property (nonatomic, copy, readonly) LNQQuery *(^select)(id attr);
@property (nonatomic, copy, readonly) NSArray *(^toArray)();

- (id)initWithArray:(NSArray *)array;

@end
