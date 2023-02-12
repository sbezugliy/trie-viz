# frozen_string_literal: true

require 'helpers/responsive_helpers'

# Navbar test helpers
module NavbarCases
  include ResponsiveHelpers

  PAGES = ['/', '/dictionary', '/principals'].freeze

  module_function

  def common_styles
    { nav: { height: '64px', 'background-color': 'rgba(74, 20, 140, 1)', color: 'rgba(255, 255, 255, 1)' },
      'div.nav-wrapper': { height: '64px' } }
  end

  def mobile_screen
    build_case('on mobile', TO_MOBILE, TO_DESKTOP) do
      { styles: common_styles,
        links: {
          Home: { visible: false }, 'Codenv.top': { visible: false },
          Github: { visible: false }, 'CI status': { visible: false }
        } }
    end
  end

  def tablet_screen
    build_case('on tablet', TO_TABLET, TO_DESKTOP) do
      { styles: common_styles,
        links: {
          Home: { visible: false }, 'Codenv.top': { visible: false },
          Github: { visible: false }, 'CI status': { visible: false }
        } }
    end
  end

  def dektop_screen
    build_case('on desktop', TO_DESKTOP, TO_DESKTOP) do
      { styles: common_styles,
        links: {
          Home: { visible: :all, path: '/' }, 'Codenv.top': { visible: :all, url: 'https://codenv.top/' },
          Github: { visible: :all, url: 'https://github.com/sbezugliy/trie-viz' }, 'CI status': { visible: :all, url: 'https://cloud.drone.io/sbezugliy/trie-viz' }
        } }
    end
  end

  def wide_screen
    build_case('on wide screen', TO_WIDE_SCREEN, TO_DESKTOP) do
      { styles: common_styles,
        links: {
          Home: { visible: true, path: '/' }, 'Codenv.top': { visible: :all, url: 'https://codenv.top/' },
          Github: { visible: :all, url: 'https://github.com/sbezugliy/trie-viz' }, 'CI status': { visible: :all, url: 'https://cloud.drone.io/sbezugliy/trie-viz' }
        } }
    end
  end
end
