#encoding: utf-8

Feature:
  顧客を複数追加できること

Background:
  Given I launch the app

Scenario Outline:
  顧客をn件追加する

  Given I touch the button marked "Add"
    And I wait to see a navigation bar titled "Detail"
    And I wait for 0.5 seconds
  When I type "<name>" into the "name" text field using the keyboard
    And I select gender to "<gender>"
    And I select age to "<age>"
    And I navigate back
  Then I wait to see a navigation bar titled "Master"
    And I should see a cell name "<name>" and division "<division>"

  Examples:
  | name                | gender | age | division |
  | Newton Geizler      | 男性   | 35  | M2層     |
  | Hermann Gottlieb    | 男性   | 34  | M1層     |
  | Mako Mori           | 女性   | 22  | F1層     |
