require 'helpers/responsive_helpers'

module FooterCases
  include ResponsiveHelpers
  
  extend self

  def footer_pages 
    ['/', '/dictionary', '/principals']
  end

  def footer_cases 
    [
      build_case_header('on mobile', TO_MOBILE, TO_DESKTOP),
			build_case_header('on tablet', TO_TABLET, TO_DESKTOP),
			build_case_header('on desktop', TO_DESKTOP, TO_DESKTOP),
			build_case_header('on wide screen', TO_WIDE_SCREEN, TO_DESKTOP)
    ]
  end
end