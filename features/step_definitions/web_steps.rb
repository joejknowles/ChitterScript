require File.expand_path(File.join(
                           File.dirname(__FILE__),
                           "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given(/^(?:|I )am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^(?:|I )go to (.+)$/) do |page_name|
  visit path_to(page_name)
end
