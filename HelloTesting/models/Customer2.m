//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import "Customer2.h"

/** Customer2の非公開フィールド/メソッド定義カテゴリ */
@interface Customer2()

/** インスタンス生成日時（age算出に使用する） */
@property(nonatomic, copy) NSDate *currentDate;

@end


@implementation Customer2

//ageのアクセサをオーバーライドする
@dynamic age;

/** initで生成日時をインスタンスフィールドに保持する */
- (id)init{
    self = [super init];
    if(self){
        self.currentDate = [NSDate date];
    }
    return self;
}

/** 年齢は生年月日から算出する */
- (NSUInteger)age{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"JST"];
    dateFormatter.dateFormat = @"yyyyMMdd";
    
    NSUInteger to   = [[dateFormatter stringFromDate:self.currentDate] intValue];
    NSUInteger from = [[dateFormatter stringFromDate:self.birth] intValue];
    if(to>from){
        return (to-from)/10000;
    }else{
        return 0;
    }
}

- (void)setAge:(NSUInteger)age{
    super.age = age;
}

/** 生年月日を文字列で設定するラッパー */
- (void)setBirthWithString:(NSString*)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"JST"];
    dateFormatter.dateFormat = @"yyyy/M/d";

    self.birth = [dateFormatter dateFromString:dateString];
}

@end
