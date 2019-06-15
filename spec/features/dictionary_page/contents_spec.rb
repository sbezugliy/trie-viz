require 'spec_helper.rb' 

RSpec.describe "Dictionary page content", type: :feature do
  
  before do
    resize_window_to_default
  end

  before :each do
    visit '/dictionary'
  end

  let(:container) {find('body').find('.main').find('.container')}

  it "has expected header" do
    h1 = container.find('h1', visible: :all)
    h1.visible?
    expect(h1).to have_content 'Trie builder'
  end

  it "has expected legend with usage info" do
    legend = container.find('div.legend', visible: :all)
    legend.visible?
    expect(legend.find('h2')).to have_content 'Format of dictionary:'
    expect(legend).to have_content "Semicolon separated words. Use '\\;' to escape semicolons that should not to be delimiters."
    expect(legend).to have_content "Example:"
    expect(legend).to have_content "one; two; three; ninety\\; nine"
    expect(legend).to have_content "will be interpretted as:"
    expect(legend).to have_content '["one", "two", "three", "ninety; nine"]'
  end

  it "has expected texts at footer" do
    footer = find("div.footer-copyright.center")
    p_block = footer.find('p.white-text', visible: :all)
    expect(p_block).to have_content 'Sergey Bezugliy © 2019'
    expect(p_block).to have_content 's.bezugliy@gmail.com'
    expect(footer.find('h5')).to have_content 'Trie UI'
  end

end