class BasePage < PageObject

  text_input_element :name, { id: 'entry_1000000' }
  drop_down_element :language, { id: 'entry_1000001' }
  submit_element :save_button, { name: 'submit' }

  PAGE_URL = 'http://bit.ly/watir-webdriver-demo'

  def submit_form(opt={})
    name.send_keys opt.fetch(:name, 'Default Name')
    language.select_option(:text, opt.fetch(:language, 'Python'))
    save_button.click
  end
end

class ResultPage < PageObject
  text_element :message_text, { css: '.ss-resp-message' }

  def message
    Selenium::WebDriver::Wait.new.until { message_text.present? }
    message_text.text
  end
end