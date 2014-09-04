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
        [customer stub:@selector(mail) andReturn:@"myemailaddress@example.com"];
        [customer stub:@selector(age) andReturn:theValue(33U)];
        [customer stub:@selector(genderString) andReturn:@"男性"];
        [customer stub:@selector(divisionString) andReturn:@"M1層"];
        [customer stub:@selector(isInDivision:) andReturn:theValue(YES) withArguments:theValue(DivisionM1), nil];
        
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
