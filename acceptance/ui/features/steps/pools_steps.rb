Given /^that multiple resource pools have been added$/ do
    visitPoolsPage()
    if @pools_page.has_text?("Showing 1 Result")
        clickAddPoolButton()
        fillInResourcePoolField("Test Pool")
        click_link_or_button("Add Resource Pool")
        checkRows("default", true)
        checkRows("Test Pool", true)
    end
end

When(/^I am on the resource pool page$/) do
    visitPoolsPage()
end

When /^I click the add Resource Pool button$/ do
    clickAddPoolButton()
end

When(/^I fill in the Resource Pool name field with "(.*?)"$/) do |resourcePool|
    fillInResourcePoolField(resourcePool)
end

When(/^I fill in the Description field with "(.*?)"$/) do |description|
    @pools_page.description_input.set description
end

Then /^I should see the add Resource Pool button$/ do
    @pools_page.addPool_button.visible?
end

Then /^I should see the Resource Pool name field$/ do
    @pools_page.poolName_input.visible?
end

Then /^I should see the Description field$/ do
    @pools_page.description_input.visible?
end

def visitPoolsPage()
    @pools_page = Pools.new
    @pools_page.navbar.resourcePools.click()
    expect(@pools_page).to be_displayed
end

def clickAddPoolButton()
    @pools_page.addPool_button.click()
end

def fillInResourcePoolField(name)
    @pools_page.poolName_input.set name
end

def removeAllAddedPools()
    defaultMatch = Capybara.match
    Capybara.match = :first
    sortColumn("Created", "descending")
    while @pools_page.pool_entries.size != 1 do
        click_link_or_button("Delete")
        click_link_or_button("Remove Pool")
    end
    Capybara.match = defaultMatch
end