require 'spec_helper.rb' 

RSpec.describe "Main page on wide screen", type: :feature do

  before do
    resize_window_to_wide
  end

  before :each do
    visit '/'
  end

  after :all do 
    resize_window_to_default
  end

  context "Navbar links includes:" do
    it "Home link => '/'" do
      find_link('Home', :visible => :all).visible?
      find_link('Home').click
      expect(current_path).to eq('/')
    end

    it "Codenv.top link => 'https://codenv.top/'" do
      find_link('Codenv.top', :visible => :all).visible?
      find_link('Codenv.top').click
      expect(current_url).to eq('https://codenv.top/')
    end

    it "Github link => 'https://github.com/sbezugliy/trie-viz'" do
      find_link('Github', :visible => :all).visible?
      find_link('Github').click
      expect(current_url).to eq("https://github.com/sbezugliy/trie-viz")
    end

    it "CI status link => 'https://cloud.drone.io/sbezugliy/trie-viz'" do
      find_link('CI status', :visible => :all).visible?
      find_link('CI status').click
      expect(current_url).to eq("https://cloud.drone.io/sbezugliy/trie-viz")
    end

    it "Link at logo => '/'" do
      find_link('Trie Text Analyzer', :visible => :all).visible?
      find_link('Trie Text Analyzer').click
      expect(current_path).to eq('/')
    end
  end
end