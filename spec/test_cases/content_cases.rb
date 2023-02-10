# frozen_string_literal: true

require 'helpers/responsive_helpers'

# Content test helpers
module ContentCases
  include ResponsiveHelpers

  module_function

  PAGES = ['/', '/dictionary', '/principals']

  def content
    [
      build_case('on mobile', TO_MOBILE, TO_DESKTOP),
      build_case('on tablet', TO_TABLET, TO_DESKTOP),
      build_case('on desktop', TO_DESKTOP, TO_DESKTOP),
      build_case('on wide screen', TO_WIDE_SCREEN, TO_DESKTOP)
    ]
  end

  def common_styles
    {}
  end

  def mobile_screen
    build_case('on mobile', TO_MOBILE, TO_DESKTOP) do
      { styles: common_styles.merge(
        'div.container': { 'max-width': '640px' }
      ) }
    end
  end

  def tablet_screen
    build_case('on tablet', TO_TABLET, TO_DESKTOP) do
      { styles: common_styles.merge(
        'div.container': { 'max-width': '960px' }
      ) }
    end
  end

  def desktop_screen
    build_case('on desktop', TO_DESKTOP, TO_DESKTOP) do
      { styles: common_styles.merge(
        'div.container': { 'max-width': '1280px' }
      ) }
    end
  end

  def wide_screen
    build_case('on wide screen', TO_WIDE_SCREEN, TO_DESKTOP) do
      { styles: common_styles.merge(
        'div.container': { 'max-width': '1920px' }
      ) }
    end
  end
end
