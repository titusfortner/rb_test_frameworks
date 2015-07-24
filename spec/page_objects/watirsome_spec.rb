require 'spec_helper'
require 'watir-webdriver'
require 'rb_test_frameworks/watirsome'

describe Watirsome do

  before(:each) do
    @browser = Watir::Browser.new :chrome
  end

  after(:each) do
    @browser.quit
  end

  it "passes form submission" do
    base_watirsome_page = BaseWatirsomePage.new(@browser)

    base_watirsome_page.submit_form(name: 'your name',
                                    language: 'Ruby')

    expect(ResultWatirsomePage.new(@browser).message).to include('Thank you')
  end

end
