require 'helpers/responsive_helpers'

module ContentCases
  include ResponsiveHelpers
  
  extend self

  def content_pages 
    ['/', '/dictionary']
  end

  def content_cases 
    [
      build_case_header('on mobile', TO_MOBILE, TO_DESKTOP),
			build_case_header('on tablet', TO_TABLET, TO_DESKTOP),
			build_case_header('on desktop', TO_DESKTOP, TO_DESKTOP),
			build_case_header('on wide screen', TO_WIDE_SCREEN, TO_DESKTOP)
    ]
  end

	def content_styles_cases
		
		common_styles = {

    }

    [
      build_case_header('on mobile', TO_MOBILE, TO_DESKTOP){{ 
				styles: common_styles.merge({
					'div.container': {
						'max-width': '1280px'
					}}) 
				}},
			build_case_header('on tablet', TO_TABLET, TO_DESKTOP){{ 
				styles: common_styles.merge({
					'div.container': {
						'max-width': '1280px'
					}}) 
				}},
			build_case_header('on desktop', TO_DESKTOP, TO_DESKTOP){{ 
				styles: common_styles.merge({
					'div.container': {
						'max-width': '1280px'
					}}) 
				}},
			build_case_header('on wide screen', TO_WIDE_SCREEN, TO_DESKTOP){{ 
				styles: common_styles.merge({
					'div.container': { 
						'max-width': '1280px'
					}}) 
				}}    
		] 
	end
end