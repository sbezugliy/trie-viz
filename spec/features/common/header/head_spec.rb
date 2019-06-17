# frozen_string_literal: true

require 'spec_helper.rb'

RSpec.describe 'HTML header on different screens', type: :feature do
  ContentCases.pages.each do |test_path|
    describe "for page at #{test_path}", type: :feature do
      before :each do
        visit test_path
      end

      it 'has expected title tag' do
        expect(page).to have_title 'Tries'
      end

      it 'has expected charset meta tag' do
        expect(page.find(:xpath, '//html/head/meta[@charset]', visible: false)[:charset]).to eq 'UTF-8'
      end

      it 'has expected title meta tag' do
        expect(page.find(:xpath, '//html/head/meta[@name="title"]', visible: false)[:content]).to eq 'Trie UI'
      end

      it 'has expected description meta tag' do
        expect(page.find(:xpath, '//html/head/meta[@name="description"]', visible: false)[:content]).to eq 'Trie Text Analyzer'
      end

      it 'has expected author meta tag' do
        expect(page.find(:xpath, '//html/head/meta[@name="author"]', visible: false)[:content]).to eq 'Sergey Bezugliy'
      end
    end
  end
end
