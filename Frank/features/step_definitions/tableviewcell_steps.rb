Then /^I should see a cell name "([^\"]*)" and division "([^\"]*)"$/ do | name, division |
  cell_label = "view:'UIButton' marked:'More info, '#{name}', '#{division}'"
  view_with_mark_exists( cell_label )
end
