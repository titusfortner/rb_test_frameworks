require 'spec_helper'
require 'capybara'

describe Capybara do
  include Capybara::DSL

  before(:each) do
    Capybara.register_driver :selenium_chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
    Capybara.current_driver = :selenium_chrome
  end
  
  after(:each) do
    page.driver.browser.quit
  end

  it "passes form submission" do
    visit 'http://bit.ly/watir-webdriver-demo'

    fill_in('entry_1000000', with: 'your name')
    select('Ruby', from: 'entry_1000001')
    click_button('Submit')

    expect(page).to have_content('Thank you')
  end
end
