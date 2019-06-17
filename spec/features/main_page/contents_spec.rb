# frozen_string_literal: true

require 'spec_helper.rb'

RSpec.describe 'Main page texts', type: :feature do
  before do
    ResponsiveHelpers.resize_window_to_default
  end

  before :each do
    visit '/'
  end

  it 'has expected texts' do
    find('h1', text: 'Trie substring search UI', visible: :all).visible?
  end

  it "has button 'Dictionary analyzis' to visualizer page" do
    find_link('Dictionary analyzis').click
    expect(current_path).to eq('/dictionary')
  end

  it "has button 'Principals' to visualizer page" do
    find_link('Principals').click
    expect(current_path).to eq('/principals')
  end
end
