require 'spec_helper'
require 'rb_test_frameworks/watirmark'
include Comparison

describe Watirmark do

  before(:each) do
    Watirmark::Configuration.instance.webdriver = 'chrome'
  end

  after(:each) do
    Page.browser.quit
  end

  it "passes form submission" do
    BaseController.new(BaseModel.new).run :create

    expect(ResultController.new.message).to include('Thank you')
  end
end

