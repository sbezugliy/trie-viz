# frozen_string_literal: true

require 'helpers/responsive_helpers'

module NavbarCases
  include ResponsiveHelpers

  extend self

  def pages
    ['/', '/dictionary', '/principals']
  end

  def content
    [
      build_case('on mobile', TO_MOBILE, TO_DESKTOP) do
        {
          links: {
            'Home': { visible: false },
            'Codenv.top': { visible: false },
            'Github': { visible: false },
            'CI status': { visible: false }
          }
        }
      end,
      build_case('on tablet', TO_TABLET, TO_DESKTOP) do
        {
          links: {
            'Home': { visible: false },
            'Codenv.top': { visible: false },
            'Github': { visible: false },
            'CI status': { visible: false }
          }
        }
      end,
      build_case('on desktop', TO_DESKTOP, TO_DESKTOP) do
        {
          links: {
            'Home': { visible: :all, path: '/' },
            'Codenv.top': { visible: :all, url: 'https://codenv.top/' },
            'Github': { visible: :all, url: 'https://github.com/sbezugliy/trie-viz' },
            'CI status': { visible: :all, url: 'https://cloud.drone.io/sbezugliy/trie-viz' }
          }
        }
      end,
      build_case('on wide screen', TO_WIDE_SCREEN, TO_DESKTOP) do
        {
          links: {
            'Home': { visible: true, path: '/' },
            'Codenv.top': { visible: :all, url: 'https://codenv.top/' },
            'Github': { visible: :all, url: 'https://github.com/sbezugliy/trie-viz' },
            'CI status': { visible: :all, url: 'https://cloud.drone.io/sbezugliy/trie-viz' }
          }
        }
      end
    ]
  end

  def styles
    common_styles = {
      'nav': {
        'height': '64px',
        'background-color': 'rgba(74, 20, 140, 1)',
        'color': 'rgba(255, 255, 255, 1)'
      },
      'div.nav-wrapper': {
        'height': '64px'
      }
    }

    [
      build_case('on mobile', TO_MOBILE, TO_DESKTOP) { { styles: common_styles } },
      build_case('on tablet', TO_TABLET, TO_DESKTOP) { { styles: common_styles } },
      build_case('on desktop', TO_DESKTOP, TO_DESKTOP) { { styles: common_styles } },
      build_case('on wide screen', TO_WIDE_SCREEN, TO_DESKTOP) { { styles: common_styles } }
    ]
  end
end
