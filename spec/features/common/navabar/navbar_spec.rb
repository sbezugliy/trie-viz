# # frozen_string_literal: true

# require 'spec_helper'

# RSpec.describe 'Navbar on different screens' do
#   before do
#     test_case[:before_hook].call
#     visit test_path
#   end

#   after do
#     test_case[:after_hook].call
#   end

#   shared_examples "test page" do |screen, test_case|
#     context "when screen is #{screen}" do
#       test_case[:links].each_pair do |link_name, state|
#         if state[:visible]
#           it "#{link_name} link => #{state[:url] || state[:path]}" do
#             find_link(link_name, visible: state[:visible]).visible?
#             find_link(link_name).click
#             expect_current_link_by_state(state)
#           end
#         else
#           it "#{link_name} link is invisible" do
#             find_link(link_name, visible: state[:visible]).visible?
#           end
#         end
#       end
#       it 'Link at logo => /' do
#         find_link('Trie Text Analyzer', visible: :all).visible?
#         find_link('Trie Text Analyzer').click
#         expect(page).to have_current_path('/')
#       end
#     end
#   end

#   NavbarCases::PAGES.each do |test_path|
#     describe "for page at #{test_path}" do
#       include_examples "test page", "mobile screen", NavbarCases.mobile_screen
#       include_examples "test page", "tablet screen", NavbarCases.tablet_screen
#       include_examples "test page", "desktop screen", NavbarCases.desktop_screen
#       include_examples "test page", "wide screen", NavbarCases.wide_screen
#     end
#   end
# end
