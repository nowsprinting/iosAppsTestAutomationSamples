//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

var target = UIATarget.localTarget();
var testcase = "Add first customer";

//テストの開始（トレースログにテストケース名が記録されます）
UIALogger.logStart(testcase);

//"+"をタップ（顧客が追加され、編集画面に遷移します）
target.frontMostApp().navigationBar().rightButton().tap();

//氏名欄に入力（0番目のUITextFieldをタップし、キーボード入力）
target.frontMostApp().mainWindow().textFields()[0].tap();
target.frontMostApp().keyboard().typeString("Newton Geizler\n");

//性別を設定（0番目のUISegmentedControlの"男性"ボタンをタップ）
target.frontMostApp().mainWindow().segmentedControls()[0].buttons()["男性"].tap();

//年齢を設定（0番目のUIPickerViewの"35"を選択）
target.frontMostApp().mainWindow().pickers()[0].wheels()[0].selectValue("35");

//一覧画面に戻る
target.frontMostApp().navigationBar().leftButton().tap();

//入力結果を検証する
var cell = target.frontMostApp().mainWindow().tableViews()["Empty list"].cells()["Newton Geizler, M2層"];
if(cell){
	UIALogger.logPass(testcase);    //セルが存在すれば成功
}else{
	UIALogger.logFail(testcase);
}
