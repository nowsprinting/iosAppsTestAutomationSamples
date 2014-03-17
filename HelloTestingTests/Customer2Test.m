//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Customer2.h"

/** 非公開プロパティにアクセスするためのカテゴリ */
@interface Customer2()

/** 当クラスインスタンス生成日時（age算出に使用する） */
@property(nonatomic, copy) NSDate *currentDate;

@end


/** Customer2テストクラス */
@interface Customer2Test : XCTestCase

@end

@implementation Customer2Test{
    /** テスト対象オブジェクト */
    Customer2 *_sut;
}

- (void)setUp{
    [super setUp];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"JST"];
    dateFormatter.dateFormat = @"yyyy/M/d";

    _sut = [[Customer2 alloc] init];
    _sut.currentDate = [dateFormatter dateFromString:@"2014/3/1"];
}

- (void)testAge_0{
    [_sut setBirthWithString:@"2013/3/2"];
    XCTAssertEqual(0U, (NSUInteger)_sut.age);   //ageはunsignedなので、expectedにもUを付加

    [_sut setBirthWithString:@"2014/3/1"];
    XCTAssertEqual(0U, (NSUInteger)_sut.age);

    [_sut setBirthWithString:@"2014/3/2"];
    XCTAssertEqual(0U, (NSUInteger)_sut.age);
}

- (void)testAge_1{
    [_sut setBirthWithString:@"2013/3/1"];
    XCTAssertEqual(1U, (NSUInteger)_sut.age);

    [_sut setBirthWithString:@"2012/3/2"];
    XCTAssertEqual(1U, (NSUInteger)_sut.age);

    [_sut setBirthWithString:@"2012/3/1"];
    XCTAssertEqual(2U, (NSUInteger)_sut.age);
}

- (void)testAge_17{
    [_sut setBirthWithString:@"1997/3/2"];
    XCTAssertEqual(16U, (NSUInteger)_sut.age);

    [_sut setBirthWithString:@"1997/3/1"];
    XCTAssertEqual(17U, (NSUInteger)_sut.age);

    [_sut setBirthWithString:@"1996/3/2"];
    XCTAssertEqual(17U, (NSUInteger)_sut.age);

    [_sut setBirthWithString:@"1996/3/1"];
    XCTAssertEqual(18U, (NSUInteger)_sut.age);
}

- (void)testAge_100{
    [_sut setBirthWithString:@"1914/3/2"];
    XCTAssertEqual(99U, (NSUInteger)_sut.age);

    [_sut setBirthWithString:@"1914/3/1"];
    XCTAssertEqual(100U, (NSUInteger)_sut.age);

    [_sut setBirthWithString:@"1913/3/2"];
    XCTAssertEqual(100U, (NSUInteger)_sut.age);

    [_sut setBirthWithString:@"1913/3/1"];
    XCTAssertEqual(101U, (NSUInteger)_sut.age);
}

@end
