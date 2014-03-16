//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import "Customer.h"

/**
 * サンプルの顧客情報管理クラス
 * 年齢を直接プロパティに持たず、生年月日プロパティから都度計算するサブクラス
 */
@interface Customer2 : Customer

/** 生年月日 */
@property(nonatomic, assign) NSDate *birth;

/** 生年月日を文字列で設定するラッパー */
- (void)setBirthWithString:(NSString*)dateString;

@end
