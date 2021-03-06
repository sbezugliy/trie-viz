# frozen_string_literal: true

require 'spec_helper.rb'

RSpec.describe 'Footer on different screens', type: :feature do
  FooterCases.pages.each do |test_path|
    describe "for page at #{test_path}", type: :feature do
      FooterCases.content.each do |test_case|
        describe "#{test_case[:name]} ", type: :feature do
          before do
            test_case[:before_hook].call
          end

          before :each do
            visit test_path
          end

          after :all do
            test_case[:after_hook].call
          end

          it 'has expected texts at footer' do
            footer = find('div.footer-copyright.center')
            p_block = footer.find('p.white-text', visible: :all)
            expect(p_block).to have_content 'Sergey Bezugliy © 2019'
            expect(p_block).to have_content 's.bezugliy@gmail.com'
            expect(footer.find('h5')).to have_content 'Trie UI'
          end
        end
      end
    end
  end
end
