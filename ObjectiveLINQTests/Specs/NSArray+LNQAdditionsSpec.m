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
    it(@"should select values from an array of objects", ^{
        NSArray *people = @[[LNQTestPerson personBob], [LNQTestPerson personMary]];
        
        NSArray *firstNames = people.select(@"firstName").toArray();
        
        NSArray *expectedNames = @[@"Bob", @"Mary"];
        expect(firstNames).to.equal(expectedNames);
    });
});

describe(@"where", ^{
    it(@"should filter array based on conditions", ^{
        LNQTestPerson *personBobSmith = [LNQTestPerson personBob];
        personBobSmith.lastName = @"Smith";
        NSArray *people = @[personBobSmith, [LNQTestPerson personMary], [LNQTestPerson personBob]];
        
        LNQTestPerson *result = people.where(@"firstName").equalTo(@"Bob").and(@"lastName").equalTo(@"Smith").single();
        
        expect(result).to.equal(personBobSmith);
    });
});

SpecEnd