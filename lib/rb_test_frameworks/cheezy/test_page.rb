class BasePageObject
  include PageObject

  text_field :name, { id: 'entry_1000000' }
  select_list :language, { id: 'entry_1000001' }
  button :save_button, { name: 'submit' }

  page_url 'http://bit.ly/watir-webdriver-demo'

  def submit_form(opt={})
    self.name = opt.fetch(:name, 'Default Name')
    self.language = opt.fetch(:language, 'Python')
    save_button
  end
end

class ResultPageObject
  include PageObject

  div :message_text, { css: '.ss-resp-message' }

  def message
    message_text_element.when_present.text
  end
end