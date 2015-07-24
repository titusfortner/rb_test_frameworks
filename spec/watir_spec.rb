require 'spec_helper'
require 'watir-webdriver'

describe Watir do

  before(:each) do
    @browser = Watir::Browser.new :chrome
  end
  
  after(:each) do
    @browser.quit
  end

  it "passes form submission" do
    @browser.goto 'bit.ly/watir-webdriver-demo'

    @browser.text_field(id: 'entry_1000000').set 'your name'
    @browser.select_list(id: 'entry_1000001').select 'Ruby'
    @browser.button(name: 'submit').click

    expect(@browser.div(class: 'ss-resp-message').when_present.text).to include('Thank you')
  end
end
