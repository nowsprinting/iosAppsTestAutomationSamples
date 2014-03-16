Then /^I save a screenshot with prefix "(\w+)"$/ do |prefix|
  filename = "cucumber-reports/" + prefix + Time.now.to_i.to_s
  %x[screencapture #{filename}.png]
end
