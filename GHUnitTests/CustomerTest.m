//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <GHUnit/GHUnit.h>
#import "Customer.h"

/** Customerテストクラス */
@interface CustomerTest : GHTestCase

@end

@implementation CustomerTest
{
    /** テスト対象オブジェクト */
    Customer *_sut;
}

/**
 * UIのテストや、メインスレッドでコールバックを受ける非同期のテストなど、テストを
 * メインスレッドで実行する必要がある場合に、YESを返すようオーバーライドします。
 * デフォルト（オーバーライドしない）はNOです。
 */
- (BOOL)shouldRunOnMainThread {
    return NO;
}

/** テストクラスのインスタンス生成時に一度だけ実行されます */
- (void)setUpClass
{
    [super setUpClass];
}

/** テストクラスのインスタンスが破棄されるとき実行されます */
- (void)tearDownClass
{
    [super tearDownClass];
}

/** 各テストメソッドの実行前に都度実行されます */
- (void)setUp
{
    [super setUp];
    _sut = [[Customer alloc] init];
}

/** 各テストメソッドの実行後に都度実行されます */
- (void)tearDown
{
    [super tearDown];
}


/** C層となるケース */
- (void)testDivision_C
{
    _sut.gender = GenderMale;
    _sut.age    = 4;
    GHAssertEquals(DivisionC, [_sut division], @"C層であること");
    
    _sut.age    = 12;
    GHAssertEquals(DivisionC, [_sut division], @"C層であること");
    
    _sut.gender = GenderFemale;
    _sut.age    = 4;
    GHAssertEquals(DivisionC, [_sut division], @"C層であること");
    
    _sut.age    = 12;
    GHAssertEquals(DivisionC, [_sut division], @"C層であること");
}

/** T層となるケース */
- (void)testDivision_T
{
    _sut.gender = GenderMale;
    _sut.age    = 13;
    GHAssertEquals(DivisionT, [_sut division], @"T層であること");
    
    _sut.age    = 19;
    GHAssertEquals(DivisionT, [_sut division], @"T層であること");
    
    _sut.gender = GenderFemale;
    _sut.age    = 13;
    GHAssertEquals(DivisionT, [_sut division], @"T層であること");
    
    _sut.age    = 19;
    GHAssertEquals(DivisionT, [_sut division], @"T層であること");
}

/** M1層となるケース */
- (void)testDivision_M1
{
    _sut.gender = GenderMale;
    _sut.age    = 20;
    GHAssertEquals(DivisionM1, [_sut division], @"M1層であること");
    
    _sut.age    = 34;
    GHAssertEquals(DivisionM1, [_sut division], @"M1層であること");
}

/** M2層となるケース */
- (void)testDivision_M2
{
    _sut.gender = GenderMale;
    _sut.age    = 35;
    GHAssertEquals(DivisionM2, [_sut division], @"M2層であること");
    
    _sut.age    = 49;
    GHAssertEquals(DivisionM2, [_sut division], @"M2層であること");
}

/** M3層となるケース */
- (void)testDivision_M3
{
    _sut.gender = GenderMale;
    _sut.age    = 50;
    GHAssertEquals(DivisionM3, [_sut division], @"M3層であること");
    
    _sut.age    = 51;
    GHAssertEquals(DivisionM3, [_sut division], @"M3層であること");
}

/** F1層となるケース */
- (void)testDivision_F1
{
    _sut.gender = GenderFemale;
    _sut.age    = 20;
    GHAssertEquals(DivisionF1, [_sut division], @"F1層であること");
    
    _sut.age    = 34;
    GHAssertEquals(DivisionF1, [_sut division], @"F1層であること");
}

/** F2層となるケース */
- (void)testDivision_F2
{
    _sut.gender = GenderFemale;
    _sut.age    = 35;
    GHAssertEquals(DivisionF2, [_sut division], @"F2層であること");
    
    _sut.age    = 49;
    GHAssertEquals(DivisionF2, [_sut division], @"F2層であること");
}

/** F3層となるケース */
- (void)testDivision_F3
{
    _sut.gender = GenderFemale;
    _sut.age    = 50;
    GHAssertEquals(DivisionF3, [_sut division], @"F3層であること");
    
    _sut.age    = 51;
    GHAssertEquals(DivisionF3, [_sut division], @"F3層であること");
}

/** 分類外となるケース */
- (void)testDivision_None
{
    _sut.gender = GenderMale;
    _sut.age    = 3;
    GHAssertEquals(DivisionNone, [_sut division], @"分類外であること");
    
    _sut.gender = GenderFemale;
    _sut.age    = 3;
    GHAssertEquals(DivisionNone, [_sut division], @"分類外であること");
}

@end
