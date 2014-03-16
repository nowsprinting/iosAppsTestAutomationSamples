//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

var target = UIATarget.localTarget();
var testcase = "Other actions";

//テストの開始（トレースログにテストケース名が記録されます）
UIALogger.logStart(testcase);

//端末を横向きに
target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_LANDSCAPELEFT);

//スクリーンショット撮影
UIATarget.localTarget().captureScreenWithName(testcase+"_1");

//端末を縦向きに
target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT);

//スクリーンショット撮影
UIATarget.localTarget().captureScreenWithName(testcase+"_2");

UIALogger.logPass(testcase);
