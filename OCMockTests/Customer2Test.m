//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "Customer2.h"

/** Customer2テストクラス（OCMockによるクラスメソッド書き換えのサンプル） */
@interface Customer2Test : XCTestCase

@end

@implementation Customer2Test{
    /** テスト対象オブジェクト */
    Customer2 *_sut;
}

- (void)setUp{
    [super setUp];
    
    //[NSDate date]が返す偽のNSDateオブジェクトを生成
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"JST"];
    dateFormatter.dateFormat = @"yyyy/M/d";
    NSDate *mockCurrentDate = [dateFormatter dateFromString:@"2014/3/1"];
    
    //NSDateのモックオブジェクトを生成、クラスメソッド[date]を置き換える
    id mockDate = [OCMockObject mockForClass:[NSDate class]];
    [[[[mockDate stub] classMethod] andReturn:mockCurrentDate] date];

    //SUT生成（内部で[NSDate date]が呼び出される）
    _sut = [[Customer2 alloc] init];
    
    //NSDateのクラスメソッド[date]の置き換えを終了
    [mockDate stopMocking];
}

- (void)testAge_0{
    [_sut setBirthWithString:@"2013/3/2"];
    XCTAssertEqual(0U, _sut.age);   //ageはunsignedなので、expectedにもUを付加

    [_sut setBirthWithString:@"2014/3/1"];
    XCTAssertEqual(0U, _sut.age);

    [_sut setBirthWithString:@"2014/3/2"];
    XCTAssertEqual(0U, _sut.age);
}

- (void)testAge_1{
    [_sut setBirthWithString:@"2013/3/1"];
    XCTAssertEqual(1U, _sut.age);

    [_sut setBirthWithString:@"2012/3/2"];
    XCTAssertEqual(1U, _sut.age);

    [_sut setBirthWithString:@"2012/3/1"];
    XCTAssertEqual(2U, _sut.age);
}

- (void)testAge_17{
    [_sut setBirthWithString:@"1997/3/2"];
    XCTAssertEqual(16U, _sut.age);

    [_sut setBirthWithString:@"1997/3/1"];
    XCTAssertEqual(17U, _sut.age);

    [_sut setBirthWithString:@"1996/3/2"];
    XCTAssertEqual(17U, _sut.age);

    [_sut setBirthWithString:@"1996/3/1"];
    XCTAssertEqual(18U, _sut.age);
}

- (void)testAge_100{
    [_sut setBirthWithString:@"1914/3/2"];
    XCTAssertEqual(99U, _sut.age);

    [_sut setBirthWithString:@"1914/3/1"];
    XCTAssertEqual(100U, _sut.age);

    [_sut setBirthWithString:@"1913/3/2"];
    XCTAssertEqual(100U, _sut.age);

    [_sut setBirthWithString:@"1913/3/1"];
    XCTAssertEqual(101U, _sut.age);
}

@end
