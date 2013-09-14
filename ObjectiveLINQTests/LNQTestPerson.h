//
//  LNQTestPerson.h
//  ObjectiveLINQ
//
//  Created by Tim Ross on 11/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNQTestPerson : NSObject

+ (LNQTestPerson *)personBob;
+ (LNQTestPerson *)personMary;

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

@end
