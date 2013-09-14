//
//  NSArray+LNQAdditionsSpec.m
//  ObjectiveLINQ
//
//  Created by Tim Ross on 11/09/13.
//  Copyright (c) 2013 elucidcode. All rights reserved.
//

#import "NSArray+LNQAdditions.h"
#import "LNQTestPerson.h"

SpecBegin(NSArray_LNQAdditions)

describe(@"select", ^{
    it(@"should select fields from an array of objects", ^{
        LNQTestPerson *personBob = [LNQTestPerson new];
        personBob.firstName = @"Bob";
        LNQTestPerson *personMary = [LNQTestPerson new];
        personMary.firstName = @"Mary";
        
        NSArray *people = @[personBob, personMary];
        NSArray *firstNames = people.select(@"firstName").toArray();
        
        NSArray *expectedNames = @[@"Bob", @"Mary"];
        expect(firstNames).to.equal(expectedNames);
    });
});

SpecEnd