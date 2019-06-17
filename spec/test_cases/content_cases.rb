# frozen_string_literal: true

require 'helpers/responsive_helpers'

module ContentCases
  include ResponsiveHelpers

  module_function

  def content_pages
    ['/', '/dictionary', '/principals']
  end

  def content_cases
    [
      build_case('on mobile', TO_MOBILE, TO_DESKTOP),
      build_case('on tablet', TO_TABLET, TO_DESKTOP),
      build_case('on desktop', TO_DESKTOP, TO_DESKTOP),
      build_case('on wide screen', TO_WIDE_SCREEN, TO_DESKTOP)
    ]
  end

  def content_styles_cases
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
