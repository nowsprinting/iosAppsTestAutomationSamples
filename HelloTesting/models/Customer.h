//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 性別の型定義
 */
typedef NS_ENUM(NSUInteger, Gender){
    GenderMale,     //男性
    GenderFemale    //女性
};

/**
 * マーケティング区分の型定義
 */
typedef NS_ENUM(NSUInteger, Division){
    DivisionM1,     //M1層（男性20-34歳）
    DivisionM2,     //M2層（男性35-49歳）
    DivisionM3,     //M3層（男性50歳以上）
    DivisionF1,     //F1層（女性20-34歳）
    DivisionF2,     //F2層（女性35-49歳）
    DivisionF3,     //F3層（女性50歳以上）
    DivisionC,      //C層（男女4-12歳）
    DivisionT,      //T層（男女13-19歳）
    DivisionNone    //分類外
};

/**
 * サンプルの顧客情報管理クラス
 */
@interface Customer : NSObject

/** 顧客名 */
@property(nonatomic, copy) NSString *name;

/** メールアドレス */
@property(nonatomic, copy) NSString *mail;

/** 性別 */
@property(nonatomic, assign) Gender gender;

/** 年齢 */
@property(nonatomic, assign) NSInteger age;

/**
 * マーケティング区分を返す
 * @retuen 該当するマーケティング区分
 */
- (Division)division;

/**
 * 引数のマーケティング区分に一致する顧客か否かをBOOL型で返す
 * @param division マーケティング区分
 * @return YES:この顧客が引数のマーケティング区分に一致する
 */
- (BOOL)isInDivision:(Division)division;

/**
 * 性別を文字列で返す
 */
- (NSString*)genderString;

/**
 * マーケティング区分を文字列で返す
 */
- (NSString*)divisionString;

@end
