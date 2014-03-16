//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Customer.h"

/** Customerテストクラス */
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
    XCTAssertEqual(DivisionC, [_sut division], @"C層であること");
    
    _sut.age    = 12;
    XCTAssertEqual(DivisionC, [_sut division], @"C層であること");
    
    _sut.gender = GenderFemale;
    _sut.age    = 4;
    XCTAssertEqual(DivisionC, [_sut division], @"C層であること");
    
    _sut.age    = 12;
    XCTAssertEqual(DivisionC, [_sut division], @"C層であること");
}

/** T層となるケース */
- (void)testDivision_T
{
    _sut.gender = GenderMale;
    _sut.age    = 13;
    XCTAssertEqual(DivisionT, [_sut division], @"T層であること");
    
    _sut.age    = 19;
    XCTAssertEqual(DivisionT, [_sut division], @"T層であること");
    
    _sut.gender = GenderFemale;
    _sut.age    = 13;
    XCTAssertEqual(DivisionT, [_sut division], @"T層であること");
    
    _sut.age    = 19;
    XCTAssertEqual(DivisionT, [_sut division], @"T層であること");
}

/** M1層となるケース */
- (void)testDivision_M1
{
    _sut.gender = GenderMale;
    _sut.age    = 20;
    XCTAssertEqual(DivisionM1, [_sut division], @"M1層であること");
    
    _sut.age    = 34;
    XCTAssertEqual(DivisionM1, [_sut division], @"M1層であること");
}

/** M2層となるケース */
- (void)testDivision_M2
{
    _sut.gender = GenderMale;
    _sut.age    = 35;
    XCTAssertEqual(DivisionM2, [_sut division], @"M2層であること");
    
    _sut.age    = 49;
    XCTAssertEqual(DivisionM2, [_sut division], @"M2層であること");
}

/** M3層となるケース */
- (void)testDivision_M3
{
    _sut.gender = GenderMale;
    _sut.age    = 50;
    XCTAssertEqual(DivisionM3, [_sut division], @"M3層であること");
    
    _sut.age    = 51;
    XCTAssertEqual(DivisionM3, [_sut division], @"M3層であること");
}

/** F1層となるケース */
- (void)testDivision_F1
{
    _sut.gender = GenderFemale;
    _sut.age    = 20;
    XCTAssertEqual(DivisionF1, [_sut division], @"F1層であること");
    
    _sut.age    = 34;
    XCTAssertEqual(DivisionF1, [_sut division], @"F1層であること");
}

/** F2層となるケース */
- (void)testDivision_F2
{
    _sut.gender = GenderFemale;
    _sut.age    = 35;
    XCTAssertEqual(DivisionF2, [_sut division], @"F2層であること");
    
    _sut.age    = 49;
    XCTAssertEqual(DivisionF2, [_sut division], @"F2層であること");
}

/** F3層となるケース */
- (void)testDivision_F3
{
    _sut.gender = GenderFemale;
    _sut.age    = 50;
    XCTAssertEqual(DivisionF3, [_sut division], @"F3層であること");
    
    _sut.age    = 51;
    XCTAssertEqual(DivisionF3, [_sut division], @"F3層であること");
}

/** 分類外となるケース */
- (void)testDivision_None
{
    _sut.gender = GenderMale;
    _sut.age    = 3;
    XCTAssertEqual(DivisionNone, [_sut division], @"分類外であること");
    
    _sut.gender = GenderFemale;
    _sut.age    = 3;
    XCTAssertEqual(DivisionNone, [_sut division], @"分類外であること");
}

@end
