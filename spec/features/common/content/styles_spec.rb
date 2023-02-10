# # frozen_string_literal: true

# require 'spec_helper'

# RSpec.describe 'Contnet container on different screens' do
#   before do
#     test_case[:before_hook].call
#     visit test_path
#   end

#   after do
#     test_case[:after_hook].call
#   end

#   shared_examples 'test page' do |screen, test_case|
#     test_case[:styles].each_pair do |selector, stylesheet|
#       context "When screen is #{screen} and styles for #{selector} node:" do
#         stylesheet.each_pair do |css_attribute, css_value|
#           it "#{css_attribute} has computed value as #{css_value}" do
#             expected_css = {}
#             expected_css[css_attribute.to_s] = css_value
#             expect(find(selector.to_s).style(css_attribute)).to eql(expected_css)
#           end
#         end
#       end
#     end
#   end

#   ContentCases::PAGES.each do |url|
#     describe "Page at #{url}" do
#       include_example 'test page', 'mobile screen', ContentCases.mobile_screen
#       include_example 'test page', 'tablet screen', ContentCases.tablet_screen
#       include_example 'test page', 'desktop screen', ContentCases.desktop_screen
#       include_example 'test page', 'wide screen', ContentCases.wide_screen
#     end
#   end
# end
