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
    it(@"should return array of results projected by the block", ^{
        NSArray *people = @[[LNQTestPerson personBob], [LNQTestPerson personMary]];
        
        NSArray *firstNames = people.select(^(LNQTestPerson *p) {
            return p.firstName;
        }).toArray();
        
        NSArray *expectedNames = @[@"Bob", @"Mary"];
        expect(firstNames).to.equal(expectedNames);
    });
});

describe(@"where", ^{
    it(@"should return array of results filtered by block", ^{
        NSArray *people = @[[LNQTestPerson personMary], [LNQTestPerson personBob]];
        
        LNQTestPerson *result = people.where(^(LNQTestPerson *p) {
            return [p.firstName isEqualToString:@"Bob"];
        }).single();
        
        expect(result.firstName).to.equal(@"Bob");
    });
});

SpecEnd