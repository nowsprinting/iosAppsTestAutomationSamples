//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>

/** 検証に使用する例外クラス定義 */
@interface OriginalException : NSException
@end
@implementation OriginalException
@end


/** GHAssertの動作サンプル */
@interface GHAssertionTest : GHTestCase

@end

@implementation GHAssertionTest

- (void)testAssertErr
{
    OSErr noError   = noErr;
    OSErr a1        = -4;
    OSErr a2        = -4;
    
    GHAssertNoErr(noError, nil);
    GHAssertErr(a1, a2, nil);
}

- (void)testAssertNULL
{
    char *sutNil    = NULL;
    char *sutNotNil = "aaaa";
    
    GHAssertNULL(sutNil, nil);
    GHAssertNotNULL(sutNotNil, nil);
}

- (void)testAssertNil
{
    NSObject *sutNil    = nil;
    NSObject *sutNotNil = [[NSObject alloc] init];
    
    GHAssertNil(sutNil, nil);
    GHAssertNotNil(sutNotNil, nil);
}

- (void)testAssertEquals
{
    NSInteger a1        = 1000;
    NSInteger a2same    = 1000;
    NSInteger a2notSame = 9999;
    
    GHAssertEquals(a1, a2same, nil);
    GHAssertNotEquals(a1, a2notSame, nil);
}

- (void)testAssertEqualObjects
{
    NSString *a1        = @"abcdef";
    NSString *a2same    = @"abcdef";
    NSString *a2notSame = @"012345";
    
    GHAssertEqualObjects(a1, a2same, nil);
    GHAssertNotEqualObjects(a1, a2notSame, nil);
}

- (void)testAssertOperation
{
    NSInteger a1        = 1000;
    NSInteger a2same    = 1000;
    NSInteger a2notSame = 9999;
    
    GHAssertOperation(a1, a2same, =, nil);
    GHAssertOperation(a1, a2notSame, !=, nil);
}

- (void)testAssertGreaterThan
{
    NSInteger a1        = 1001;
    NSInteger a2        = 1000;
    
    GHAssertGreaterThan(a1, a2, nil);
    GHAssertGreaterThanOrEqual(a1, a1, nil);
    GHAssertGreaterThanOrEqual(a1, a2, nil);
}

- (void)testAssertLessThan
{
    NSInteger a1        = 1000;
    NSInteger a2        = 1001;
    
    GHAssertLessThan(a1, a2, nil);
    GHAssertLessThanOrEqual(a1, a1, nil);
    GHAssertLessThanOrEqual(a1, a2, nil);
}

- (void)testAssertEqualStrings
{
    NSString *a1        = @"abcdef";
    NSString *a2same    = @"abcdef";
    NSString *a2notSame = @"012345";
    
    GHAssertEqualStrings(a1, a2same, nil);
    GHAssertNotEqualStrings(a1, a2notSame, nil);
}

- (void)testAssertEqualCStrings
{
    const char *a1          = "abcdef";
    const char *a2same      = "abcdef";
    const char *a2notSame   = "012345";
    
    GHAssertEqualCStrings(a1, a2same, nil);
    GHAssertNotEqualCStrings(a1, a2notSame, nil);
}

- (void)testAssertEqualWithAccuracy
{
    double a1   = 0.021;
    double a2   = 0.071 - 0.05;
    
    GHAssertEqualsWithAccuracy(a1, a2, 0.0001, @"丸め誤差が出ても成功します");
//    GHAssertEquals(a1, a2, @"このテストは失敗します");
}

- (void)testAssertTrue
{
    GHAssertTrue(true, nil);
    GHAssertTrueNoThrow(true, nil);
}

- (void)testAssertFalse
{
    GHAssertFalse(false, nil);
    GHAssertFalseNoThrow(false, nil);
}


- (void)testAssertThrows
{
    GHAssertThrows([@"abcdef" substringWithRange:NSMakeRange(5,9)], nil);
//    GHAssertThrows([@"abcdef" substringWithRange:NSMakeRange(5,1)], @"このテストは失敗します");
}

- (void)testAssertThrowsSpecific
{
    GHAssertThrowsSpecific([@"abcdef" substringWithRange:NSMakeRange(5,9)], NSException, nil);
//    GHAssertThrowsSpecific([@"abcdef" substringWithRange:NSMakeRange(5,9)], OriginalException, @"このテストは失敗します");
//    GHAssertThrowsSpecific([@"abcdef" substringWithRange:NSMakeRange(5,1)], NSException, @"このテストは失敗します");
}

- (void)testAssertThrowsSpecificNamed
{
    GHAssertThrowsSpecificNamed([@"abcdef" substringWithRange:NSMakeRange(5,9)], NSException, NSRangeException, nil);
//    GHAssertThrowsSpecificNamed([@"abcdef" substringWithRange:NSMakeRange(5,9)], NSException, NSInvalidArgumentException, @"このテストは失敗します");
//    GHAssertThrowsSpecificNamed([@"abcdef" substringWithRange:NSMakeRange(5,1)], NSException, NSRangeException, @"このテストは失敗します");
}

- (void)testAssertNoThrow
{
//    GHAssertNoThrow([@"abcdef" substringWithRange:NSMakeRange(5,9)], @"このテストは失敗します");
    GHAssertNoThrow([@"abcdef" substringWithRange:NSMakeRange(5,1)], nil);
}

- (void)testAssertNoThrowsSpecific
{
//    GHAssertNoThrowSpecific([@"abcdef" substringWithRange:NSMakeRange(5,9)], NSException, @"このテストは失敗します");
    GHAssertNoThrowSpecific([@"abcdef" substringWithRange:NSMakeRange(5,9)], OriginalException, nil);
    GHAssertNoThrowSpecific([@"abcdef" substringWithRange:NSMakeRange(5,1)], NSException, nil);
}

- (void)testAssertNoThrowsSpecificNamed
{
//    GHAssertNoThrowSpecificNamed([@"abcdef" substringWithRange:NSMakeRange(5,9)], NSException, NSRangeException, @"このテストは失敗します");
    GHAssertNoThrowSpecificNamed([@"abcdef" substringWithRange:NSMakeRange(5,9)], NSException, NSInvalidArgumentException, nil);
    GHAssertNoThrowSpecificNamed([@"abcdef" substringWithRange:NSMakeRange(5,1)], NSException, NSRangeException, nil);
}

@end
