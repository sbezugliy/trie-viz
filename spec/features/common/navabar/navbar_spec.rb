# frozen_string_literal: true

require 'spec_helper.rb'

RSpec.describe 'Navbar on different screens', type: :feature do
  NavbarCases.pages.each do |test_path|
    describe "for page at #{test_path}", type: :feature do
      NavbarCases.content.each do |test_case|
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

          context 'Navbar links:' do
            test_case[:links].each_pair do |link_name, state|
              if state[:visible]
                it "#{link_name} link => #{state[:url] || state[:path]}" do
                  find_link(link_name, visible: state[:visible]).visible?
                  find_link(link_name).click
                  expect_current_link_by_state(state)
                end
              else
                it "#{link_name} link is invisible" do
                  find_link(link_name, visible: state[:visible]).visible?
                end
              end
            end
            it 'Link at logo => /' do
              find_link('Trie Text Analyzer', visible: :all).visible?
              find_link('Trie Text Analyzer').click
              expect(current_path).to eq('/')
            end
          end
        end
      end
    end
  end
end
