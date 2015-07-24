module Comparison

  class BaseView < Watirmark::Page

    keyword(:name) { browser.text_field(id: 'entry_1000000') }
    keyword(:language) { browser.select_list(id: 'entry_1000001') }
    keyword(:save_button) { browser.button(name: 'submit') }

    def create(_model=nil)
      browser.goto 'bit.ly/watir-webdriver-demo'
    end
  end

  class ResultView < Watirmark::Page
    keyword(:message) { browser.div(class: 'ss-resp-message') }
  end


  class BaseController < Watirmark::WebPage::Controller
    @view = BaseView

    def submit
      @view.save_button.click
    end
  end

  class ResultController < Watirmark::WebPage::Controller
    @view = ResultView

    def message
      @view.message.when_present.text
    end

  end

  class BaseModel < Watirmark::Model::Factory
    keywords BaseView.keywords

    defaults do
      name {'your name'}
      language {'Ruby'}
    end

  end
end