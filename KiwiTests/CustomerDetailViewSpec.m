//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Kiwi.h"
#import "CustomerDetailView.h"

/** CustomerDetailViewテストクラス（Kiwiによるテストスタブのサンプル） */
SPEC_BEGIN(CustomerDetailViewSpec)

describe(@"CustomerDetailView test using stub", ^{
    __block CustomerDetailView *sut;
    
    beforeEach(^{
        UINib* nib = [UINib nibWithNibName:@"CustomerDetailView" bundle:nil];
        NSArray* array = [nib instantiateWithOwner:nil options:nil];
        sut = [array objectAtIndex:0];
    });
    
    it(@"use normally stub", ^{
        //Test Stubを準備する
        Customer *customer = [[Customer alloc] init];
        customer.name = @"岩田 貫一";
        [[customer stubAndReturn:@"myemailaddress@example.com"] mail];
        [[customer stubAndReturn:theValue(33U)] age];
        [[customer stubAndReturn:@"男性"] genderString];
        [[customer stubAndReturn:@"M1層"] divisionString];
        [[customer stubAndReturn:theValue(YES)] isInDivision:DivisionM1];
        
        [sut setCustomer:customer];
        
        //SUTのUILabelにセットされていることを確認（表示内容の確認ではない）
        [[sut.nameLabel.text should] equal:@"岩田 貫一"];
        [[sut.mailLabel.text should] equal:@"myemailaddress@example.com"];
        [[sut.genderLabel.text should] equal:@"男性"];
        [[sut.ageLabel.text should] equal:@"33"];
        [[sut.marketDivisionLabel.text should] equal:@"M1層"];
        
        //引数付きメソッドのスタブを確認（SUTでは使っていないがサンプルとして）
        [[theValue([customer isInDivision:DivisionM1]) should] equal:theValue(YES)];
    });
});

/** Kiwiによる非同期テストのサンプル */
describe(@"CustomerDetailView asynchronous testing", ^{
    __block CustomerDetailView *sut;
    
    beforeEach(^{
        UINib* nib = [UINib nibWithNibName:@"CustomerDetailView" bundle:nil];
        NSArray* array = [nib instantiateWithOwner:nil options:nil];
        sut = [array objectAtIndex:0];
        //アバター画像取得確認のため、デフォルト画像を一旦nilに差し替える
        [sut.avatarImage setImage:nil];
    });
    
    it(@"connect to gravatar.com(asynchronous)", ^{
        __block Customer *customer = [[Customer alloc] init];
        customer.mail = @"myemailaddress@example.com";
        
        //非同期処理を実行
        [sut setCustomer:customer];
        
        //1秒後にアバター画像が取得できていること（nilでないこと）をチェック
        [[expectFutureValue(sut.avatarImage.image) shouldEventually] beNonNil];
    });
});

SPEC_END
