Then /^I should see \"(.+)\"$/ do |title|
    page.should have_content(title)
end

