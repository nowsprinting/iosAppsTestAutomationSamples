//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Kiwi.h"
#import "GravatarAccessor.h"


/** 非同期のテスト用GravatarAvatarDelegate実装 */
@interface GravatarAvatarDelegateStub : NSObject<GravatarAvatarDelegate>

/** 取得成功時にアバター画像を格納する */
@property(nonatomic, strong) UIImage *avatar;

@end

@implementation GravatarAvatarDelegateStub

/** 取得成功時のスタブ実装 */
- (void)responseAvatar:(UIImage*)avatar{
    self.avatar = avatar;
}

/** 取得失敗時のスタブ実装 */
- (void)responseError:(NSString*)message{
    self.avatar = nil;
}

@end


/** GravatarAccessorクラスのテスト（Kiwiによる非同期テストのサンプル） */
SPEC_BEGIN(GravatarAccessorAsynchronousSpec)

describe(@"asynchronous testing", ^{
    it(@"connect to gravatar.com(asynchronous)", ^{
        //delegateのStubを準備する
        __block GravatarAvatarDelegateStub *stub = [[GravatarAvatarDelegateStub alloc] init];
        
        NSOperationQueue *queue = [NSOperationQueue mainQueue];
        [queue addOperationWithBlock:^{
            //非同期処理を実行
            GravatarAccessor *sut = [[GravatarAccessor alloc] initWithMail:@"myemailaddress@example.com" delegate:stub];
            [sut requestAvatar];
        }];
        
        //1秒後にアバター画像が取得できていること（nilでないこと）をチェック
        [[expectFutureValue(stub.avatar) shouldEventually] beNonNil];
    });
});

SPEC_END
