//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "NLTHTTPStubServer.h"
#import "GravatarAccessor.h"

/** NLTHTTPStubServerを利用したGravatarAccessorのテスト */
@interface GravatarAccessorTest : GHAsyncTestCase <GravatarAvatarDelegate>

@end

@implementation GravatarAccessorTest{
    NLTHTTPStubServer *_server;
}

- (void)setUpClass{
    [super setUpClass];
    _server = [NLTHTTPStubServer sharedServer];
}

- (void)setUp{
    [super setUp];
    [_server clear];
}

- (void)testRequestAvatar_success{
    //スタブサーバの設定
    [[[_server expect] forPath:@"/avatar/0bc83cb571cd1c50ba6f3e8a78ef1346" HTTPMethod:@"GET"] andResponseResource:@"testavatar" ofType:@"png"];
    
    //非同期処理実行前にはこの[prepare]メソッドを必ず呼びます
    [self prepare];
    
    //非同期処理を実行
    GravatarAccessor *sut = [[GravatarAccessor alloc] initWithMail:@"myemailaddress@example.com" delegate:self];
    [sut requestAvatar];
    
    //非同期処理が完了（成功）するのを待機します。timeout秒が経過するとテストは失敗します
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];
    
    //スタブサーバにexpectしたURLにアクセスされたことを検証
    [_server verify];
}

- (void)testRequestAvatar_failure{
    //スタブサーバの設定（ステータスコード500を返します）
    [[[_server expect] forPath:@"/avatar/0bc83cb571cd1c50ba6f3e8a78ef1346" HTTPMethod:@"GET"] andStatusCode:500];
    
    //非同期処理実行前にはこの[prepare]メソッドを必ず呼びます
    [self prepare];
    
    //非同期処理を実行
    GravatarAccessor *sut = [[GravatarAccessor alloc] initWithMail:@"myemailaddress@example.com" delegate:self];
    [sut requestAvatar];
    
    //非同期処理が完了（成功）するのを待機します。timeout秒が経過するとテストは失敗します
    [self waitForStatus:kGHUnitWaitStatusFailure timeout:10.0];
    
    //スタブサーバにexpectしたURLにアクセスされたことを検証
    [_server verify];
}


#pragma mark - GravatarAvatarDelegate methods

//取得成功（GravatarAvatarDelegateのメソッド）
- (void)responseAvatar:(UIImage*)avatar{
    //テスト成功を通知
    [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testRequestAvatar_success)];
}

//取得失敗（GravatarAvatarDelegateのメソッド）
- (void)responseError:(NSString*)message{
    GHTestLog(message);
    //テスト失敗を通知
    [self notify:kGHUnitWaitStatusFailure forSelector:@selector(testRequestAvatar_failure)];
}

@end
