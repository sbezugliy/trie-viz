# frozen_string_literal: true

require 'spec_helper.rb'

RSpec.describe 'Dictionary page form', type: :feature do
  before do
    resize_window_to_default
  end

  before :each do
    visit '/dictionary'
  end

  let!(:dictionary) { 'one; two; three; ninety\; nine; nine' }
  let!(:text) { 'one three nine nineteen five seven' }

  it 'has required components' do
    form = find_form('#analyzer-form')
    expect(form).to have_field('text')
    expect(form).to have_field('dictionary')
    expect(form).to have_select('type', options: ['Full', 'Flat', 'Aho-Corasick'], visible: false)
  end

  it 'fill dictionary form' do
    form = find_form('#analyzer-form')
    form.find('textarea#dictionary-data_dictionary').fill_in(with: dictionary)
    form.find('textarea#analyzer-text_text').fill_in(with: text)
    find('select', visible: false)
      .find('option', text: 'Flat', visible: false).select_option
    click_on('Execute')
  end
end
