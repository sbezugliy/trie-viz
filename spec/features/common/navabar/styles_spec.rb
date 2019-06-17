require 'spec_helper.rb' 

RSpec.describe "Navbar styles on different screens", type: :feature do
  NavbarCases.navbar_pages.each do |test_path|
    describe "for page at #{test_path}", type: :feature do
      NavbarCases.navbar_styles_cases.each do |test_case|
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

          test_case[:styles].each_pair do |selector, stylesheet|
            context "Styles for #{selector.to_s} node:" do
              stylesheet.each_pair do |css_attribute, css_value|
                it "#{css_attribute} has computed value as #{css_value}" do
                  expected_css = {}
                  expected_css[css_attribute.to_s] = css_value
                  expect(find(selector.to_s).style(css_attribute)).to eql(expected_css)
                end
              end
            end
          end
        end
      end
    end
  end
end