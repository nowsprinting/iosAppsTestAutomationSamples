//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Kiwi.h"
#import "GravatarAccessor.h"

/** 非公開フィールドにアクセスするためのカテゴリ */
@interface GravatarAccessor()

/** 通知先デリゲート */
@property(nonatomic, weak) id<GravatarAvatarDelegate> delegate;

/** ステータスコード */
@property(nonatomic, assign) NSInteger statusCode;

/** MIMEType */
@property(nonatomic, copy) NSString *MIMEType;

/** レスポンス本体 */
@property(nonatomic, strong) NSMutableData *responseAccumulator;

@end


/** GravatarAccessorクラスのテスト（Kiwiによるモックオブジェクトのサンプル） */
SPEC_BEGIN(GravatarAccessorSpec)

describe(@"GravatarAccessor test using mock", ^{
    __block GravatarAccessor *sut;
    __block NSURLConnection *conn;  //NSURLConnectionDataDelegateのメソッドでnilが警告されるので、空のオブジェクトを用意する
    
    beforeEach(^{
        sut = [[GravatarAccessor alloc]
               initWithMail:@"myemailaddress@example.com" delegate:nil];

        conn = [[NSURLConnection alloc] init];
    });
    
    describe(@"didReceiveResponse test using stub", ^{
        it(@"", ^{
            //Test Stubを準備する
            //このテストはNSHTTPURLResponseインスタンスでも可能ですが、スタブを使うほうがシンプルに書けます
            NSHTTPURLResponse *response = [NSHTTPURLResponse mock];
            [response stub:@selector(statusCode) andReturn:theValue(200)];
            [response stub:@selector(MIMEType) andReturn:@"image/png"];
            
            [sut connection:conn didReceiveResponse:response];
            
            //レスポンスからインスタンスフィールドにコピーされていることを確認
            [[theValue(sut.statusCode) should] equal:theValue(200)];
            [[sut.MIMEType should] equal:@"image/png"];
        });
    });
    
    describe(@"didReceiveData test using mock", ^{
        it(@"use normally mock", ^{
            //検証用NSData
            NSBundle *testBundle = [NSBundle bundleForClass:[self class]];
            NSString *path = [testBundle pathForResource:@"testavatar" ofType:@"png"];
            NSData *dummyData = [NSData dataWithContentsOfFile:path];
            [[dummyData shouldNot] beNil];
            
            //Mock Objectを準備する
            NSMutableData *mockMutableData = [NSMutableData mock];
            [[mockMutableData should] receive:@selector(appendData:) withArguments:dummyData];
            sut.responseAccumulator = mockMutableData;
            
            [sut connection:conn didReceiveData:dummyData];
        });
    });
    
    describe(@"connectionDidFinishLoading test using protocol mock", ^{
        it(@"success case", ^{
            //delegateのMock Objectを準備する
            id mockDelegate = [KWMock mockForProtocol:@protocol(GravatarAvatarDelegate)];
            [[mockDelegate should] receive:@selector(responseAvatar:) withArguments:any()];
            sut.delegate = mockDelegate;
            
            //SUTに通信成功状態をセット
            NSHTTPURLResponse *response = [NSHTTPURLResponse mock];
            [response stub:@selector(statusCode) andReturn:theValue(200)];
            [response stub:@selector(MIMEType) andReturn:@"image/png"];
            [sut connection:conn didReceiveResponse:response];
            
            [sut connectionDidFinishLoading:conn];
        });
        
        it(@"failure case", ^{
            //delegateのMock Objectを準備する
            id mockDelegate = [KWMock mockForProtocol:@protocol(GravatarAvatarDelegate)];
            [[mockDelegate should] receive:@selector(responseError:) withArguments:@"Bad statusCode:500"];
            sut.delegate = mockDelegate;
            
            //SUTに通信失敗状態をセット
            NSHTTPURLResponse *response = [NSHTTPURLResponse mock];
            [response stub:@selector(statusCode) andReturn:theValue(500)];
            [response stub:@selector(MIMEType) andReturn:@"image/png"];
            [sut connection:conn didReceiveResponse:response];
            
            [sut connectionDidFinishLoading:conn];
        });
    });
    
    describe(@"didFailWithError test using mock", ^{
        it(@"call didFailWithError case", ^{
            //delegateのMock Objectを準備する
            id mockDelegate = [KWMock mockForProtocol:@protocol(GravatarAvatarDelegate)];
            [[mockDelegate should] receive:@selector(responseError:) withArguments:@"Error! domain:d, code:-9"];
            sut.delegate = mockDelegate;
            
            NSError *testError = [NSError errorWithDomain:@"d" code:-9 userInfo:nil];
            [sut connection:conn didFailWithError:testError];
        });
    });
});

SPEC_END
