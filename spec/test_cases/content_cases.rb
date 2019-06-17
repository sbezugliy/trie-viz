# frozen_string_literal: true

require 'helpers/responsive_helpers'

module ContentCases
  include ResponsiveHelpers

  extend self
  
  def pages
    ['/', '/dictionary', '/principals']
  end

  def content
    [
      build_case('on mobile', TO_MOBILE, TO_DESKTOP),
      build_case('on tablet', TO_TABLET, TO_DESKTOP),
      build_case('on desktop', TO_DESKTOP, TO_DESKTOP),
      build_case('on wide screen', TO_WIDE_SCREEN, TO_DESKTOP)
    ]
  end

  def styles
    common_styles = {

    }

    [
      build_case('on mobile', TO_MOBILE, TO_DESKTOP) do
        {
          styles: common_styles.merge(
            'div.container': {
              'max-width': '1280px'
            }
          )
        }
      end,
      build_case('on tablet', TO_TABLET, TO_DESKTOP) do
        {
          styles: common_styles.merge(
            'div.container': {
              'max-width': '1280px'
            }
          )
        }
      end,
      build_case('on desktop', TO_DESKTOP, TO_DESKTOP) do
        {
          styles: common_styles.merge(
            'div.container': {
              'max-width': '1280px'
            }
          )
        }
      end,
      build_case('on wide screen', TO_WIDE_SCREEN, TO_DESKTOP) do
        {
          styles: common_styles.merge(
            'div.container': {
              'max-width': '1280px'
            }
          )
        }
      end
    ]
  end
end
