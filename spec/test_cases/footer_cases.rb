require 'helpers/responsive_helpers'

module FooterCases
  include ResponsiveHelpers
  
  extend self

  def footer_pages 
    ['/', '/dictionary']
  end

  def footer_cases 
    [
      {
        name: 'on mobile',
        before_hook: TO_MOBILE,
        after_hook: TO_DESKTOP
      },{
        name: 'on tablet',
        before_hook: TO_TABLET,
        after_hook: TO_DESKTOP
      },{
        name: 'on desktop',
        before_hook: TO_DESKTOP,
        after_hook: TO_DESKTOP
      },{
        name: 'on wide screen',
        before_hook: TO_WIDE_SCREEN,
        after_hook: TO_DESKTOP
      }
    ]
  end
end