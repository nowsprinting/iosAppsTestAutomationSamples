//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "CustomerDetailView.h"

/** CustomerDetailViewテストクラス（OCMockによるテストスタブのサンプル） */
@interface CustomerDetailViewTest : XCTestCase

@end

@implementation CustomerDetailViewTest

- (void)testSetCustomer{
    //Test Stubを準備する
    id customer = [OCMockObject mockForClass:[Customer class]];
    [[[customer stub] andReturn:@"岩田 貫一"] name];
    [[[customer stub] andReturn:@"myemailaddress@example.com"] mail];
    [[[customer stub] andReturnValue:OCMOCK_VALUE((NSInteger){33})] age];
    [[[customer stub] andReturn:@"男性"] genderString];
    [[[customer stub] andReturn:@"M1層"] divisionString];
    [[[customer stub] andReturnValue:OCMOCK_VALUE((BOOL){YES})] isInDivision:DivisionM1];
    
    UINib* nib = [UINib nibWithNibName:@"CustomerDetailView" bundle:nil];
    NSArray* array = [nib instantiateWithOwner:nil options:nil];
    CustomerDetailView *sut = [array objectAtIndex:0];
    
    [sut setCustomer:customer];
    
    //SUTのUILabelにセットされていることを確認（表示内容の確認ではない）
    XCTAssertEqualObjects(@"岩田 貫一", sut.nameLabel.text);
    XCTAssertEqualObjects(@"myemailaddress@example.com", sut.mailLabel.text);
    XCTAssertEqualObjects(@"男性", sut.genderLabel.text);
    XCTAssertEqualObjects(@"33", sut.ageLabel.text);
    XCTAssertEqualObjects(@"M1層", sut.marketDivisionLabel.text);
    
    //引数付きメソッドのスタブを確認（SUTでは使っていないがサンプルとして）
    XCTAssertTrue([customer isInDivision:DivisionM1]);
}

- (void)testException{
    //例外オブジェクトの準備
    NSException *excep = [NSException exceptionWithName:NSRangeException reason:nil userInfo:nil];
    
    //Test Stubを準備する
    id customer = [OCMockObject mockForClass:[Customer class]];
    [[[customer stub] andThrow:excep] name];
    
    UINib* nib = [UINib nibWithNibName:@"CustomerDetailView" bundle:nil];
    NSArray* array = [nib instantiateWithOwner:nil options:nil];
    CustomerDetailView *sut = [array objectAtIndex:0];
    
    //nameメソッドで例外が発生することを確認（例外発生すれば成功）
    XCTAssertThrows([sut setCustomer:customer]);
}

@end
