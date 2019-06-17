# frozen_string_literal: true

require 'helpers/responsive_helpers'

module FooterCases
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
end
