# frozen_string_literal: true
# # frozen_string_literal: true

# require 'spec_helper'

# RSpec.describe 'Dictionary page content' do
#   before do
#     resize_window_to_default
#     visit '/dictionary'
#   end

#   let(:container) { find('body').find('.main').find('.container') }

#   it 'has expected header' do
#     h1 = container.find('h1', visible: :all)
#     h1.visible?
#     expect(h1).to have_content 'Trie builder'
#   end

#   it 'has expected legend with usage info' do
#     legend = container.find('div.legend', visible: :all)
#     legend.visible?
#     expect(legend.find('h2')).to have_content 'Format of dictionary:'
#     expect(legend).to have_content "Semicolon separated words. Use '\\;' to escape semicolons that should not to be delimiters."
#     expect(legend).to have_content 'Example:'
#     expect(legend).to have_content 'one; two; three; ninety\\; nine'
#     expect(legend).to have_content 'will be interpretted as:'
#     expect(legend).to have_content '["one", "two", "three", "ninety; nine"]'
#   end
# end
