require 'spec_helper'
require 'rb_test_frameworks/sefury'

describe SeleniumFury do

  after(:each) do
    driver.quit
  end

  it "passes form submission" do
    launch_web_driver BasePage::PAGE_URL

    BasePage.new(driver).submit_form(name: 'your name',
                                     language: 'Ruby')
    expect(ResultPage.new(driver).message).to include('Thank you')
  end
end

