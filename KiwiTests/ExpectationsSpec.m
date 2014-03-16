//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Kiwi.h"
#import "Customer.h"

/** KiwiのExpectationsサンプル */
SPEC_BEGIN(ExpectationsSpec)

describe(@"Expectations examples by Customer class", ^{
    __block Customer *sut;
    
    beforeEach(^{
        sut = [[Customer alloc] init];
        sut.gender = GenderFemale;
        sut.age = 20;
    });

    it(@"Object nil expectations", ^{
        [[sut should] beNonNil];
        [[sut shouldNot] beNil];
        [sut shouldNotBeNil];
    });
    
    it(@"Object extends and implementation expectations", ^{
        [[sut should] beKindOfClass:[Customer class]];
        [[sut shouldNot] conformToProtocol:@protocol(NSURLConnectionDataDelegate)];
    });
    
    it(@"Numeric expectations", ^{
        [[theValue(sut.age) should] beLessThan:theValue(21)];
        [[theValue(sut.age) should] beLessThanOrEqualTo:theValue(20)];
        [[theValue(sut.age) should] beGreaterThan:theValue(19)];
        [[theValue(sut.age) should] beGreaterThanOrEqualTo:theValue(20)];
    });
    
    it(@"Boolean expectations", ^{
        [[theValue([sut isInDivision:DivisionF1]) should] beYes];
    });
    
    it(@"String expectations", ^{
        [[[sut divisionString] should] startWithString:@"F1"];
        [[[sut divisionString] should] matchPattern:@"^.1.+$"];
    });
    
    it(@"Collection expectations", ^{
        NSArray *actualArray = @[@"1", @"2", @"3"];
        [[actualArray should] haveCountOf:3];
    });
});

//it()でなくpending_()を使用すると、このテストは実行時に評価されない（常に成功する）
pending_(@"pending failure case", ^{
    fail(@"fail");
});

SPEC_END
