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


/** GravatarAccessorテストクラス（OCMockioによるモックオブジェクトのサンプル） */
@interface GravatarAccessorTest : XCTestCase

@end

@implementation GravatarAccessorTest{
    /** テスト対象オブジェクト */
    GravatarAccessor *_sut;

    /** NSURLConnectionDataDelegateのメソッドでnilが警告されるので、空のオブジェクトを用意する */
    NSURLConnection *_conn;
}

- (void)setUp{
    [super setUp];
    _sut = [[GravatarAccessor alloc]
                initWithMail:@"myemailaddress@example.com" delegate:nil];

    _conn = [[NSURLConnection alloc] init];
}

- (void)testDidReceiveResponse{
    //Test Stubを準備する
    //このテストはNSHTTPURLResponseインスタンスでも可能ですが、スタブを使うほうがシンプルに書けます
    NSHTTPURLResponse *response = mock([NSHTTPURLResponse class]);
    [given([response statusCode]) willReturnInteger:200];
    [given([response MIMEType]) willReturn:@"image/png"];
    
    [_sut connection:_conn didReceiveResponse:response];
    
    //レスポンスからインスタンスフィールドにコピーされていることを確認
    XCTAssertEqual(200, _sut.statusCode);
    XCTAssertEqualObjects(@"image/png", _sut.MIMEType);
}

- (void)testDidReceiveData{
    //検証用NSData
    NSBundle *testBundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [testBundle pathForResource:@"testavatar" ofType:@"png"];
    NSData *dummyData = [NSData dataWithContentsOfFile:path];
    XCTAssertNotNil(dummyData, @"テスト画像がロードできていること");
    
    //Mock Objectを準備する（OCMockitoはこの時点でexpectしません）
    NSMutableData *mockMutableData = mock([NSMutableData class]);
    _sut.responseAccumulator = mockMutableData;

    [_sut connection:_conn didReceiveData:dummyData];
    
    //内部で[appendData:]が呼ばれたことを検証
    [verify(mockMutableData) appendData:dummyData];
}

- (void)testConnectionDidFinishLoading_success{
    //delegateのMock Objectを準備する（OCMockitoはこの時点でexpectしません）
    id<GravatarAvatarDelegate> mockDelegate = mockProtocol(@protocol(GravatarAvatarDelegate));
    _sut.delegate = mockDelegate;
    
    //SUTに通信成功状態をセット
    NSHTTPURLResponse *response = mock([NSHTTPURLResponse class]);
    [given([response statusCode]) willReturnInteger:200];
    [given([response MIMEType]) willReturn:@"image/png"];
    [_sut connection:_conn didReceiveResponse:response];
    
    [_sut connectionDidFinishLoading:_conn];

    //内部で[responseAvatar:]が呼ばれたことを検証
    [verify(mockDelegate) responseAvatar:nil];
}

- (void)testConnectionDidFinishLoading_failure{
    //delegateのMock Objectを準備する（OCMockitoはこの時点でexpectしません）
    id<GravatarAvatarDelegate> mockDelegate = mockProtocol(@protocol(GravatarAvatarDelegate));
    _sut.delegate = mockDelegate;
    
    //SUTに通信失敗状態をセット
    NSHTTPURLResponse *response = mock([NSHTTPURLResponse class]);
    [given([response statusCode]) willReturnInteger:500];
    [given([response MIMEType]) willReturn:@"image/png"];
    [_sut connection:_conn didReceiveResponse:response];
    
    [_sut connectionDidFinishLoading:_conn];
    
    //内部で[responseError:]が呼ばれたことを検証
    [verify(mockDelegate) responseError:@"Bad statusCode:500"];
}

- (void)testDidFailWithError{
    //delegateのMock Objectを準備する（OCMockitoはこの時点でexpectしません）
    id<GravatarAvatarDelegate> mockDelegate = mockProtocol(@protocol(GravatarAvatarDelegate));
    _sut.delegate = mockDelegate;
    
    NSError *testError = [NSError errorWithDomain:@"d" code:-9 userInfo:nil];
    [_sut connection:_conn didFailWithError:testError];
    
    //内部で[responseError:]が呼ばれたことを検証
    [verify(mockDelegate) responseError:@"Error! domain:d, code:-9"];
}

@end
