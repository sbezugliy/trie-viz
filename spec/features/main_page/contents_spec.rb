# frozen_string_literal: true
# # frozen_string_literal: true

# require 'spec_helper'

# RSpec.describe 'Main page texts' do
#   before do
#     ResponsiveHelpers.resize_window_to_default
#     visit '/'
#   end

#   it 'has expected texts' do
#     find('h1', text: 'Trie substring search UI', visible: :all).visible?
#   end

#   it "has button 'Dictionary analyzis' to visualizer page" do
#     find_link('Dictionary analyzis').click
#     expect(page).to have_current_path('/dictionary')
#   end

#   it "has button 'Principals' to visualizer page" do
#     find_link('Principals').click
#     expect(page).to have_current_path('/principals')
#   end
# end
