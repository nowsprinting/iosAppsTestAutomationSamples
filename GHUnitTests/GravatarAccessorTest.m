//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <GHUnit/GHUnit.h>
#import "GravatarAccessor.h"

//非同期のテストを行なう場合にはGHAsyncTestCaseを継承します
@interface GravatarAccessorTest : GHAsyncTestCase <GravatarAvatarDelegate>

@end

@implementation GravatarAccessorTest

- (void)testRequestAvatar{
    //非同期処理実行前にはこの[prepare]メソッドを必ず呼びます
    [self prepare];
    
    //非同期処理を実行
    GravatarAccessor *sut = [[GravatarAccessor alloc] initWithMail:@"myemailaddress@example.com" delegate:self];
    [sut requestAvatar];
    
    //非同期処理が完了（成功）するのを待機します。timeout秒が経過するとテストは失敗します
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];
}


#pragma mark - GravatarAvatarDelegate methods

//取得成功（GravatarAvatarDelegateのメソッド）
- (void)responseAvatar:(UIImage*)avatar{
    //テスト成功を通知
    [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testRequestAvatar)];
}

//取得失敗（GravatarAvatarDelegateのメソッド）
- (void)responseError:(NSString*)message{
    GHTestLog(message);
    //テスト失敗を通知
    [self notify:kGHUnitWaitStatusFailure forSelector:@selector(testRequestAvatar)];
}

@end
