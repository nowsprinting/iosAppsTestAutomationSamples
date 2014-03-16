#encoding: utf-8

Feature:
  顧客を追加できること。一覧画面には氏名とマーケティング区分が表示されること

Scenario:
  "Add"ボタンをタップすると顧客を1件追加し、編集画面に遷移する

  Given I launch the app
  When I touch the button marked "Add"
  Then I wait to see a navigation bar titled "Detail"

Scenario:
  顧客は男性・35歳に設定。一覧に戻ると、マーケティング区分はM2層となること

  Given I should see a navigation bar titled "Detail"
    And I wait for 0.5 seconds
  When I type "Newton Geizler" into the "name" text field using the keyboard
    And I select gender to "男性"
    And I select age to "35"
    And I navigate back
  Then I wait to see a navigation bar titled "Master"
    And I should see a cell name "Newton Geizler" and division "M2層"
