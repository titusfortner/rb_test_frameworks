class BaseWatirsomePage
  include Watirsome

  text_field :name, { id: 'entry_1000000' }
  select_list :language, { id: 'entry_1000001' }
  button :save_button, { name: 'submit' }

  def initialize_page
    @browser.goto 'bit.ly/watir-webdriver-demo'
  end

  def submit_form(opt={})
    self.name = opt.fetch(:name, 'Default Name')
    self.language = opt.fetch(:language, 'Python')
    save_button
  end
end

class ResultWatirsomePage
  include Watirsome

  div :message_text, { css: '.ss-resp-message' }

  def message
    message_text_div.when_present.text
  end
end




