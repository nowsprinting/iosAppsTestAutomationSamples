When /^I select age to "(\d*)"$/ do | age_text |
  selector = "view:'UIPickerView' marked:'age'"
  row_index = age_text.to_i - 4
  views_switched = frankly_map( selector, 'selectRow:inComponent:animated:', row_index, 0, true )
  raise "could not find anything matching [#{age_text}.#{row_index}] to switch" if views_switched.empty?
  sleep 0.5
end
