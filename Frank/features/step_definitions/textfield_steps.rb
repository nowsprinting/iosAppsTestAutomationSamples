When /^I type "([^"]*)" into the "([^"]*)" text field using the keyboard$/ do |text_to_type, placeholder|
  text_field_selector =  "view marked:'#{placeholder}'"
  check_element_exists( text_field_selector )
  touch( text_field_selector )
  frankly_map( text_field_selector, 'setText:', text_to_type )
  frankly_map( text_field_selector, 'endEditing:', true )
end
