require 'spec_helper.rb' 

RSpec.describe "Main page on mobile", type: :feature do
  
  before do
    resize_window_to_mobile
  end

  before :each do
    visit '/'
  end

  after :all do 
    resize_window_to_default
  end

  context "Navbar links includes:" do
    
    it "Home link is invisible" do
      find_link('Home', visible: false).visible?
    end

    it "Codenv.top link is invisible'" do
      find_link('Codenv.top', visible: false).visible?
    end

    it "Github link is invisible" do
      find_link('Github', visible: false).visible?
    end

    it "CI status link is invisible" do
      find_link('CI status', visible: false).visible?
    end

    it "Link at logo => '/'" do
      link = find('a.brand-logo.right', text: 'Trie Text Analyzer', visible: :all) 
      link.visible?
      link.click
      expect(current_path).to eq('/')
    end
  end
end