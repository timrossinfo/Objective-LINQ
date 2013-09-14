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
        NSArray *people = @[[LNQTestPerson personBob], [LNQTestPerson personMary]];
        
        NSArray *firstNames = people.select(@"firstName").toArray();
        
        NSArray *expectedNames = @[@"Bob", @"Mary"];
        expect(firstNames).to.equal(expectedNames);
    });
});

describe(@"where", ^{
    it(@"should filter array based on a condition", ^{
        LNQTestPerson *personBob = [LNQTestPerson personBob];
        NSArray *people = @[personBob, [LNQTestPerson personMary]];
        
        LNQTestPerson *result = people.where(@"firstName").equalTo(@"Bob").single();
        
        expect(result).to.equal(personBob);
    });
});

SpecEnd