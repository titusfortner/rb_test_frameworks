require 'spec_helper'
require 'rb_test_frameworks/cheezy'

describe PageObject do
  require 'page-object/page_factory'
  include PageObject::PageFactory

  context Watir do
    require 'watir-webdriver'

    before(:each) do
      @browser = Watir::Browser.new :chrome
    end

    after(:each) do
      @browser.quit
    end

    it "passes form submission" do
      visit(BasePageObject).submit_form(name: 'your name',
                                        language: 'Ruby')

      expect(on(ResultPageObject).message).to include('Thank you')
    end

  end

  context Selenium::WebDriver do
    require 'selenium-webdriver'
    before(:each) do
      @browser = Selenium::WebDriver.for :chrome
    end

    after(:each) do
      @browser.quit
    end

    it "passes form submission" do
      visit(BasePageObject).submit_form(name: 'your name',
                                       language: 'Ruby')

      expect(on(ResultPageObject).message).to include('Thank you')
    end
  end
end
