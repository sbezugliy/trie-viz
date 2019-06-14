require 'spec_helper.rb' 

RSpec.describe "Main page texts", type: :feature do
  
  before do
    resize_window_to_default
  end

  before :each do
    visit '/'
  end

  it "has expected texts" do
    find('h1', text: 'Trie substring search UI', visible: :all).visible?
  end

  it "has expected texts at footer" do
    footer = find("div.footer-copyright.center")
    p_block = footer.find('p.white-text', visible: :all)
    expect(p_block).to have_content 'Sergey Bezugliy © 2019'
    expect(p_block).to have_content 's.bezugliy@gmail.com'
    expect(footer.find('h5')).to have_content 'Trie UI'
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