#顧客を追加
Button Add Tap

#顧客情報を入力
Input name EnterText "Newton Geizler" enter
ButtonSelector "gender segmentedcontrol" Select 男性
ItemSelector "age pickerview" Select 35

#Previewで表示内容を確認
Button "Preview on WebView" Tap
View name Verify "Newton Geizler"
View gender Verify 男性
View age Verify 35
View division Verify "M2層"

#Detailに戻る
Button Detail Tap

#Masterに戻る（画面遷移直後はボタンが反応しないためVerify後にTapする）
Button Master Verify "Master"
Button Master Tap

