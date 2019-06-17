# frozen_string_literal: true

require 'spec_helper.rb'

RSpec.describe 'Principals page texts', type: :feature do
  before do
    ResponsiveHelpers.resize_window_to_default
  end

  before :each do
    visit '/principals'
  end

  it 'has expected texts' do
    find('h1', text: 'To be done...', visible: :all).visible?
  end
end
