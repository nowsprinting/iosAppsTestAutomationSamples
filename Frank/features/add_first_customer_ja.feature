#encoding: utf-8
#language: ja

機能:
  顧客を追加できること。一覧画面には氏名とマーケティング区分が表示されること

シナリオ:
  "Add"ボタンをタップすると顧客を1件追加し、編集画面に遷移する

  前提 I launch the app
  もし I touch the button marked "Add"
  ならば I wait to see a navigation bar titled "Detail"

シナリオ:
  顧客は男性・35歳に設定。一覧に戻ると、マーケティング区分はM2層となること

  前提 I should see a navigation bar titled "Detail"
    かつ I wait for 0.5 seconds
  もし I type "Newton Geizler" into the "name" text field using the keyboard
    かつ I select gender to "男性"
    かつ I select age to "35"
    かつ I navigate back
  ならば I wait to see a navigation bar titled "Master"
    かつ I should see a cell name "Newton Geizler" and division "M2層"
