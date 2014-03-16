//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Customer.h"

/**
 * Customerテストクラスの例2（共通部分を抽出してリファクタリングしたパターン）
 */
@interface CustomerTestExtracted : XCTestCase

/** GenderおよびAgeを設定し、divisionを求める処理を抽出したメソッド */
//- (void)divisionWithGender:(Gender)gender age:(NSUInteger)age;

@end

@implementation CustomerTestExtracted{
    /** テスト対象オブジェクト */
    Customer *_sut;
}

- (void)setUp{
    [super setUp];
    _sut = [[Customer alloc] init];
}

- (void)tearDown{
    [super tearDown];
}

/** C層となるケース */
- (void)testDivision_C{
    XCTAssertEqual(DivisionC, [self divisionWithGender:GenderMale age:4]);
    XCTAssertEqual(DivisionC, [self divisionWithGender:GenderMale age:12]);
    XCTAssertEqual(DivisionC, [self divisionWithGender:GenderFemale age:4]);
    XCTAssertEqual(DivisionC, [self divisionWithGender:GenderFemale age:12]);
}

/** T層となるケース */
- (void)testDivision_T{
    XCTAssertEqual(DivisionT, [self divisionWithGender:GenderMale age:13]);
    XCTAssertEqual(DivisionT, [self divisionWithGender:GenderMale age:19]);
    XCTAssertEqual(DivisionT, [self divisionWithGender:GenderFemale age:13]);
    XCTAssertEqual(DivisionT, [self divisionWithGender:GenderFemale age:19]);
}

/** M1層となるケース */
- (void)testDivision_M1{
    XCTAssertEqual(DivisionM1, [self divisionWithGender:GenderMale age:20]);
    XCTAssertEqual(DivisionM1, [self divisionWithGender:GenderMale age:34]);
}

/** M2層となるケース */
- (void)testDivision_M2{
    XCTAssertEqual(DivisionM2, [self divisionWithGender:GenderMale age:35]);
    XCTAssertEqual(DivisionM2, [self divisionWithGender:GenderMale age:49]);
}

/** M3層となるケース */
- (void)testDivision_M3{
    XCTAssertEqual(DivisionM3, [self divisionWithGender:GenderMale age:50]);
    XCTAssertEqual(DivisionM3, [self divisionWithGender:GenderMale age:51]);
}

/** F1層となるケース */
- (void)testDivision_F1{
    XCTAssertEqual(DivisionF1, [self divisionWithGender:GenderFemale age:20]);
    XCTAssertEqual(DivisionF1, [self divisionWithGender:GenderFemale age:34]);
}

/** F2層となるケース */
- (void)testDivision_F2{
    XCTAssertEqual(DivisionF2, [self divisionWithGender:GenderFemale age:35]);
    XCTAssertEqual(DivisionF2, [self divisionWithGender:GenderFemale age:49]);
}

/** F3層となるケース */
- (void)testDivision_F3{
    XCTAssertEqual(DivisionF3, [self divisionWithGender:GenderFemale age:50]);
    XCTAssertEqual(DivisionF3, [self divisionWithGender:GenderFemale age:51]);
}

/** 分類外となるケース */
- (void)testDivision_None{
    XCTAssertEqual(DivisionNone, [self divisionWithGender:GenderMale age:3]);
    XCTAssertEqual(DivisionNone, [self divisionWithGender:GenderFemale age:3]);
}



#pragma mark - 

/** GenderおよびAgeを設定し、divisionを求める処理を抽出したメソッド */
- (Division)divisionWithGender:(Gender)gender age:(NSUInteger)age{
    _sut.gender = gender;
    _sut.age    = age;
    return [_sut division];
}

@end
