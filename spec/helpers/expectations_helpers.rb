# frozen_string_literal: true

module ExpectationsHelpers
  def expect_current_link_by_state(state)
    return expect(current_url).to eq(state[:url]) if state.key? :url
    return expect(page).to have_current_path(state[:path], ignore_query: true) if state.key? :path

    raise 'State should contain :url or :path to expected link of current page.'
  end
end
