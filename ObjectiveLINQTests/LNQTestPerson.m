//
//  LNQTestPerson.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 11/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "LNQTestPerson.h"

@implementation LNQTestPerson

+ (LNQTestPerson *)personBob {
    LNQTestPerson *person = [LNQTestPerson new];
    person.firstName = @"Bob";
    return person;
}

+ (LNQTestPerson *)personMary {
    LNQTestPerson *person = [LNQTestPerson new];
    person.firstName = @"Mary";
    return person;
}

@end
