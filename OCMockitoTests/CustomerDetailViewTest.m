//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>
#import "CustomerDetailView.h"

/** CustomerDetailViewテストクラス（OCMockitoによるテストスタブのサンプル） */
@interface CustomerDetailViewTest : XCTestCase

@end

@implementation CustomerDetailViewTest

- (void)testSetCustomer{
    //Test Stubを準備する
    Customer *customer = mock([Customer class]);
    [given([customer name]) willReturn:@"岩田 貫一"];
    [given([customer mail]) willReturn:@"myemailaddress@example.com"];
    [given([customer age]) willReturnUnsignedInteger:33U];
    [given([customer genderString]) willReturn:@"男性"];
    [given([customer divisionString]) willReturn:@"M1層"];
    [given([customer isInDivision:DivisionM1]) willReturnBool:YES];
    
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

@end
