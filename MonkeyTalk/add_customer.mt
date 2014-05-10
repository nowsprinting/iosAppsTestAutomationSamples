#顧客登録と検証をパラメタライズ
Vars * Define name mail gender age division

#顧客を追加
Button Add Tap

#顧客情報を入力
Input name EnterText ${name} enter
Input mail EnterText ${mail} enter
ButtonSelector "gender segmentedcontrol" Select ${gender}
ItemSelector "age pickerview" Select ${age}

#Previewで表示内容を確認
Button "Preview on WebView" Tap
View name Verify ${name}
View gender Verify ${gender}
View age Verify ${age}
View division Verify ${division}

#Detailに戻る
Button Detail Tap

#Masterに戻る（画面遷移直後はボタンが反応しないためVerify後にTapする）
Button Master Verify "Master"
Button Master Tap

