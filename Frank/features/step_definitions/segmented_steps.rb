When /^I select gender to "([^"]*)"$/ do |gender_text|
  selector = "view:'UISegment' marked:'#{gender_text}'"
  touch( selector )
end
