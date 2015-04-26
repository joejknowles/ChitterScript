require File.expand_path(File.join(
                           File.dirname(__FILE__),
                           "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end

  def sign_up(options)
    options = defaults.merge(options)
    visit '/'
    username = options[:username]
    fill_in 'register-username', with: username
    password = options[:password]
    fill_in 'register-password', with: password
    click_button 'Register'
  end

  def sign_in(options)
    options = defaults.merge(options)
    visit '/'
    username = options[:username]
    fill_in 'sign-in-username', with: username
    password = options[:password]
    fill_in 'sign-in-password', with: password
    click_button 'Sign in'
  end

  def sign_out
    click_button 'Sign out'
    sleep 0.08
  end

  def defaults
    { username: 'joejknowles', password: 'secret' }
  end
end
World(WithinHelpers)

Given(/^(?:|I )am on (.+)$/) do |page_name|
  sleep 0.09
  visit path_to(page_name)
end

When(/^(?:|I )go to (.+)$/) do |page_name|
  visit path_to(page_name)
end

Given(/^"([^"]*)" signs up$/) do |name|
  sign_up(username: name)
end

Then(/^I see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

Then(/^I don't see "([^"]*)"$/) do |text|
  expect(page).not_to have_content text
end

When(/^I sign in as "([^"]*)"$/) do |username|
  sign_in(username: username)
end

When(/^I sign out$/) do
  sign_out
end

When(/^I cheep "([^"]*)"$/) do |cheep|
  fill_in 'cheep', with: cheep
  click_button 'Cheep'
end

Given(/^I sign in with incorrect details$/) do
  sign_in(password: 'blah')
end

Then(/^I see (\d+)$/) do |number|
  expect(page).not_to have_content number
end

When(/^I click smile$/) do
  find('.smiles__img').click
end

Then(
  /^I see "([^\"]*)" within "([^\"]*)"?$/
) do |text, selector|
  element = find(selector)
  expect(element).to have_content text
end

When(/^(.*) ten times$/) do |first_step|
  10.times { step first_step }
end

When(/^I press "([^"]*)" button$/) do |button|
  click_button button
end


