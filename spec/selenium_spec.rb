require 'spec_helper'
require 'selenium-webdriver'

describe Selenium::WebDriver do

  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
  end
  
  after(:each) do
    @driver.quit
  end

  it "passes form submission" do
    @driver.get 'http://bit.ly/watir-webdriver-demo'

    @driver.first(id: 'entry_1000000').send_keys 'your name'

    select_element = @driver.first(id: 'entry_1000001')
    option = Selenium::WebDriver::Support::Select.new(select_element)
    option.select_by(:text, "Ruby")
    @driver.first(name: 'submit').click

    Selenium::WebDriver::Wait.new.until { !@driver.all(css: '.ss-resp-message').empty? }

    expect(@driver.first(css: '.ss-resp-message').text).to include('Thank you')
  end
end
