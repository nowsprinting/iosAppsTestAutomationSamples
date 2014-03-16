//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <KIF/KIF.h>
//#import "KIFUITestActor+EXAdditions.h"

@interface AddFirstCustomer : KIFTestCase

@end

@implementation AddFirstCustomer

- (void)beforeEach
{
    //"Add"ボタンをタップすると顧客を1件追加し、編集画面に遷移する
    [tester tapViewWithAccessibilityLabel:@"Add"];
}

- (void)afterEach
{
    //
}

- (void)testAddFirstCustomer
{
    //名前を設定
    [tester enterText:@"Newton Geizler" intoViewWithAccessibilityLabel:@"name"];
    
    //男性・35歳に設定
    [tester tapViewWithAccessibilityLabel:@"男性"];
    [tester selectPickerViewRowWithTitle:@"35"];
    
    //一覧に戻る
    [tester tapViewWithAccessibilityLabel:@"Master"];
    
    //マーケティング区分はM2層となること
    [tester waitForTappableViewWithAccessibilityLabel:@"Newton Geizler, M2層"];
}

@end
