require 'selenium_fury'

PageObjectSF = PageObject
Object.send(:remove_const, "PageObject")

require_relative 'sefury/test_page'
include SeleniumFury::SeleniumWebDriver::CreateSeleniumWebDriver
