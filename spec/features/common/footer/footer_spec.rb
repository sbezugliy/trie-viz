# # frozen_string_literal: true

# require 'spec_helper'

# RSpec.describe 'Footer on different screens' do
#   FooterCases.pages.each do |test_path|
#     describe "for page at #{test_path}" do
#       FooterCases.content.each do |test_case|
#         describe (test_case[:name]).to_s do
#           before do
#             test_case[:before_hook].call
#             visit test_path
#           end

#           after do
#             test_case[:after_hook].call
#           end

#           let(:footer) { find('div.footer-copyright.center') }
#           let(:p_block) { footer.find('p.white-text', visible: :all) }

#           it { expect(p_block).to have_content 'Sergey Bezugliy © 2019' }
#           it { expect(p_block).to have_content 's.bezugliy@gmail.com' }
#           it { expect(footer.find('h5')).to have_content 'Trie UI' }
#         end
#       end
#     end
#   end
# end
