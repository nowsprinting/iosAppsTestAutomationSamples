//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "Customer.h"

/** Customerテストクラス（OCHamcrest使用サンプル） */
@interface CustomerTest : XCTestCase

@end

@implementation CustomerTest
{
    /** テスト対象オブジェクト */
    Customer *_sut;
}

- (void)setUp
{
    [super setUp];
    _sut = [[Customer alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

/** C層となるケース */
- (void)testDivision_C
{
    _sut.gender = GenderMale;
    _sut.age    = 4;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionC));
    
    _sut.age    = 12;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionC));
    
    _sut.gender = GenderFemale;
    _sut.age    = 4;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionC));
    
    _sut.age    = 12;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionC));
}

/** T層となるケース */
- (void)testDivision_T
{
    _sut.gender = GenderMale;
    _sut.age    = 13;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionT));
    
    _sut.age    = 19;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionT));
    
    _sut.gender = GenderFemale;
    _sut.age    = 13;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionT));
    
    _sut.age    = 19;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionT));
}

/** M1層となるケース */
- (void)testDivision_M1
{
    _sut.gender = GenderMale;
    _sut.age    = 20;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionM1));
    
    _sut.age    = 34;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionM1));
}

/** M2層となるケース */
- (void)testDivision_M2
{
    _sut.gender = GenderMale;
    _sut.age    = 35;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionM2));
    
    _sut.age    = 49;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionM2));
}

/** M3層となるケース */
- (void)testDivision_M3
{
    _sut.gender = GenderMale;
    _sut.age    = 50;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionM3));
    
    _sut.age    = 51;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionM3));
}

/** F1層となるケース */
- (void)testDivision_F1
{
    _sut.gender = GenderFemale;
    _sut.age    = 20;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionF1));
    assertThat([_sut divisionString], equalTo(@"F1層"));
    
    _sut.age    = 34;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionF1));
    assertThat([_sut divisionString], startsWith(@"F1"));
}

/** F2層となるケース */
- (void)testDivision_F2
{
    _sut.gender = GenderFemale;
    _sut.age    = 35;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionF2));
    
    _sut.age    = 49;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionF2));
}

/** F3層となるケース */
- (void)testDivision_F3
{
    _sut.gender = GenderFemale;
    _sut.age    = 50;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionF3));
    
    _sut.age    = 51;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionF3));
}

/** 分類外となるケース */
- (void)testDivision_None
{
    _sut.gender = GenderMale;
    _sut.age    = 3;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionNone));
    
    _sut.gender = GenderFemale;
    _sut.age    = 3;
    assertThatUnsignedInteger([_sut division], equalToUnsignedInteger(DivisionNone));
}

@end
