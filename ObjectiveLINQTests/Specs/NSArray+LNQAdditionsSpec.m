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
    it(@"should return array of items projected by block", ^{
        NSArray *people = @[[LNQTestPerson personBob], [LNQTestPerson personMary]];
        
        NSArray *firstNames = people.select(^(LNQTestPerson *p) {
            return p.firstName;
        }).toArray();
        
        NSArray *expectedNames = @[@"Bob", @"Mary"];
        expect(firstNames).to.equal(expectedNames);
    });
});

describe(@"selectMany", ^{
    it(@"should return flattened array of items projected by block", ^{
        NSArray *people = @[[LNQTestPerson personBob], [LNQTestPerson personMary]];
        
        NSArray *phoneNumbers = people.selectMany(^(LNQTestPerson *p) {
            return p.phoneNumbers;
        }).toArray();
        
        NSArray *expectedNumbers = @[@960822, @960285, @960500, @960506];
        expect(phoneNumbers).to.equal(expectedNumbers);
    });
});

describe(@"where", ^{
    it(@"should return array with items restricted by block", ^{
        NSArray *people = @[[LNQTestPerson personMary], [LNQTestPerson personBob]];
        
        LNQTestPerson *result = people.where(^(LNQTestPerson *p) {
            return [p.firstName isEqualToString:@"Bob"];
        }).single();
        
        expect(result.firstName).to.equal(@"Bob");
    });
});

describe(@"orderBy", ^{
    it(@"should return array of items ordered by key", ^{
        NSArray *people = @[[LNQTestPerson personMary], [LNQTestPerson personBob]];
        
        NSArray *firstNames = people.orderBy(@"firstName").select(^(LNQTestPerson *p) {
            return p.firstName;
        }).toArray();
        
        NSArray *expectedNames = @[@"Bob", @"Mary"];
        expect(firstNames).to.equal(expectedNames);
    });
});

describe(@"orderByDescending", ^{
    it(@"should return array of items ordered by key in descending order", ^{
        NSArray *people = @[[LNQTestPerson personMary], [LNQTestPerson personBob]];
        
        NSArray *firstNames = people.orderByDescending(@"firstName").select(^(LNQTestPerson *p) {
            return p.firstName;
        }).toArray();
        
        NSArray *expectedNames = @[@"Mary", @"Bob"];
        expect(firstNames).to.equal(expectedNames);
    });
});

SpecEnd