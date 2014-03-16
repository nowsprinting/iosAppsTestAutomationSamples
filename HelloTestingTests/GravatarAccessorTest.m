//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GravatarAccessor.h"

/** 非公開メソッドをテストするためのカテゴリ */
@interface GravatarAccessor()

/** 文字列をMD5ハッシュ化して返す非公開メソッド */
- (NSString*)md5from:(NSString*)string;

@end


/** GravatarAccessorテストクラス */
@interface GravatarAccessorTest : XCTestCase

@end

@implementation GravatarAccessorTest{
    /** テスト対象オブジェクト */
    GravatarAccessor *_sut;
}

- (void)setUp{
    [super setUp];
    _sut = [[GravatarAccessor alloc] init];
}

- (void)testMd5from{
    NSString *expected  = @"0bc83cb571cd1c50ba6f3e8a78ef1346";
    NSString *actual    = [_sut md5from:@"myemailaddress@example.com"];
    XCTAssertEqualObjects(expected, actual);
}

@end
