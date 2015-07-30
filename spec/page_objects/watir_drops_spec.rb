require 'spec_helper'
require 'rb_test_frameworks/watir_drops'

describe WatirDrops do

  after(:all) do
    WatirDrops::Session.instance.quit
  end

  it 'fills out form default' do
    TestDropPage.new.visit.submit_form

    expect(ResultDropPage.new.message).to include('Thank you')
  end


end
