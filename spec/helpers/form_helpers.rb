# frozen_string_literal: true

module FormHelpers
  def find_form(selector = '')
    page.find('body')
        .find('.main')
        .find('.container')
        .find("form#{selector}")
  end
end
