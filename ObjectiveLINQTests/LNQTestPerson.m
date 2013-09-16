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
    person.phoneNumbers = @[@960822, @960285];
    return person;
}

+ (LNQTestPerson *)personMary {
    LNQTestPerson *person = [LNQTestPerson new];
    person.firstName = @"Mary";
    person.phoneNumbers = @[@960500, @960506];
    return person;
}

@end
