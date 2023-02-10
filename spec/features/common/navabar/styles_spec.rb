# # frozen_string_literal: true

# require 'spec_helper'

# RSpec.describe 'Navbar styles on different screens' do
#   NavbarCases.pages.each do |test_path|
#     describe "for page at #{test_path}" do
#       NavbarCases.styles.each do |test_case|
#         describe (test_case[:name]).to_s do
#           before do
#             test_case[:before_hook].call
#             visit test_path
#           end

#           after do
#             test_case[:after_hook].call
#           end

#           test_case[:styles].each_pair do |selector, stylesheet|
#             context "Styles for #{selector} node:" do
#               stylesheet.each_pair do |css_attribute, css_value|
#                 it "#{css_attribute} has computed value as #{css_value}" do
#                   expected_css = {}
#                   expected_css[css_attribute.to_s] = css_value
#                   expect(find(selector.to_s).style(css_attribute)).to eql(expected_css)
#                 end
#               end
#             end
#           end
#         end
#       end
#     end
#   end
# end
