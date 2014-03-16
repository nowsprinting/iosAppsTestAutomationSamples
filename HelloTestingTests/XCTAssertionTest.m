//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>

/** 検証に使用する例外クラス定義 */
@interface OriginalException : NSException
@end
@implementation OriginalException
@end


/** XCTAssertの動作サンプル */
@interface XCTAssertionTest : XCTestCase

@end

@implementation XCTAssertionTest

- (void)testAssertNil
{
    NSObject *sutNil    = nil;
    NSObject *sutNotNil = [[NSObject alloc] init];
    
    XCTAssertNil(sutNil);
//    XCTAssertNil(sutNotNil, @"このテストは失敗します");
    
    XCTAssertNotNil(sutNotNil);
//    XCTAssertNotNil(sutNil, @"このテストは失敗します");
}

- (void)testAssertTrue
{
    XCTAssert(true);
//    XCTAssert(false, @"このテストは失敗します");
    
    XCTAssertTrue(true);
//    XCTAssertTrue(false, @"このテストは失敗します");
    
    XCTAssertFalse(false);
//    XCTAssertFalse(true, @"このテストは失敗します");
}

- (void)testAssertEqualObjects
{
    NSString *a1        = @"abcdef";
    NSString *a2same    = @"abcdef";
    NSString *a2notSame = @"012345";
    
    XCTAssertEqualObjects(a1, a2same);
//    XCTAssertEqualObjects(a1, a2notSame, @"このテストは失敗します");
    
    XCTAssertNotEqualObjects(a1, a2notSame);
//    XCTAssertNotEqualObjects(a1, a2same, @"このテストは失敗します");
}

- (void)testAssertEqual
{
    NSInteger a1        = 1000;
    NSInteger a2same    = 1000;
    NSInteger a2notSame = 9999;
    
    XCTAssertEqual(a1, a2same);
//    XCTAssertEqual(a1, a2notSame, @"このテストは失敗します");
    
    XCTAssertNotEqual(a1, a2notSame);
//    XCTAssertNotEqual(a1, a2same, @"このテストは失敗します");
}

- (void)testAssertEqualWithAccuracy
{
    double a1   = 0.021;
    double a2   = 0.071 - 0.05;
    
    XCTAssertEqualWithAccuracy(a1, a2, 0.0001, @"丸め誤差が出ても成功します");
//    XCTAssertEqual(a1, a2, @"このテストは失敗します");
}

- (void)testAssertThrows
{
    XCTAssertThrows([@"abcdef" substringWithRange:NSMakeRange(5,9)]);
//    XCTAssertThrows([@"abcdef" substringWithRange:NSMakeRange(5,1)], @"このテストは失敗します");
}

- (void)testAssertThrowsSpecific
{
    XCTAssertThrowsSpecific([@"abcdef" substringWithRange:NSMakeRange(5,9)], NSException);
//    XCTAssertThrowsSpecific([@"abcdef" substringWithRange:NSMakeRange(5,9)], OriginalException, @"このテストは失敗します");
//    XCTAssertThrowsSpecific([@"abcdef" substringWithRange:NSMakeRange(5,1)], NSException, @"このテストは失敗します");
}

- (void)testAssertThrowsSpecificNamed
{
    XCTAssertThrowsSpecificNamed([@"abcdef" substringWithRange:NSMakeRange(5,9)], NSException, NSRangeException);
//    XCTAssertThrowsSpecificNamed([@"abcdef" substringWithRange:NSMakeRange(5,9)], NSException, NSInvalidArgumentException, @"このテストは失敗します");
//    XCTAssertThrowsSpecificNamed([@"abcdef" substringWithRange:NSMakeRange(5,1)], NSException, NSRangeException, @"このテストは失敗します");
}

- (void)testAssertNoThrow
{
//    XCTAssertNoThrow([@"abcdef" substringWithRange:NSMakeRange(5,9)], @"このテストは失敗します");
    XCTAssertNoThrow([@"abcdef" substringWithRange:NSMakeRange(5,1)]);
}

- (void)testAssertNoThrowsSpecific
{
//    XCTAssertNoThrowSpecific([@"abcdef" substringWithRange:NSMakeRange(5,9)], NSException, @"このテストは失敗します");
    XCTAssertNoThrowSpecific([@"abcdef" substringWithRange:NSMakeRange(5,9)], OriginalException);
    XCTAssertNoThrowSpecific([@"abcdef" substringWithRange:NSMakeRange(5,1)], NSException);
}

- (void)testAssertNoThrowsSpecificNamed
{
//    XCTAssertNoThrowSpecificNamed([@"abcdef" substringWithRange:NSMakeRange(5,9)], NSException, NSRangeException, @"このテストは失敗します");
    XCTAssertNoThrowSpecificNamed([@"abcdef" substringWithRange:NSMakeRange(5,9)], NSException, NSInvalidArgumentException);
    XCTAssertNoThrowSpecificNamed([@"abcdef" substringWithRange:NSMakeRange(5,1)], NSException, NSRangeException);
}

@end
