//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * アバター画像の取得通知を受けるデリゲート
 */
@protocol GravatarAvatarDelegate

/**
 * gravatar.comからのアバター画像取得完了通知
 * @param avatar 取得したアバター画像
 */
- (void)responseAvatar:(UIImage*)avatar;

/**
 * gravatar.comからのアバター画像取得失敗通知
 * @param message エラー内容（レスポンスのステータスコードなど）
 */
- (void)responseError:(NSString*)message;

@end


/**
 * gravatar.comにアクセスしてemailに対応するアバター画像を取得・管理するクラス
 */
@interface GravatarAccessor : NSObject <NSURLConnectionDataDelegate>

/**
 * アバター取得対象メールアドレスと通知先デリゲートを指定して初期化
 */
- (id)initWithMail:(NSString*)mail delegate:(id<GravatarAvatarDelegate>)delegate;

/**
 * アバター取得をリクエストする（非同期で取得し、デリゲートに通知する）
 */
- (void)requestAvatar;

@end
