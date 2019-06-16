require 'helpers/responsive_helpers'

module NavbarCases
  include ResponsiveHelpers
  
  extend self

  TO_MOBILE      = lambda{resize_window_to_mobile}
  TO_TABLET      = lambda{resize_window_to_tablet}
  TO_DESKTOP     = lambda{resize_window_to_default}
  TO_WIDE_SCREEN = lambda{resize_window_to_wide}

  def navbar_pages 
    ['/', '/dictionary']
  end

  def navbar_cases 
    [
      {
        name: 'on mobile',
        before_hook: TO_MOBILE,
        after_hook: TO_DESKTOP,
        links: {
            'Home': { visible: false },
            'Codenv.top': { visible: false },
            'Github': { visible: false },
            'CI status': { visible: false }
        }
      },{
        name: 'on tablet',
        before_hook: TO_TABLET,
        after_hook: TO_DESKTOP,
        links: {
            'Home': { visible: false },
            'Codenv.top': { visible: false },
            'Github': { visible: false },
            'CI status': { visible: false }
        }
      },{
        name: 'on desktop',
        before_hook: TO_DESKTOP,
        after_hook: TO_DESKTOP,
        links: {
            'Home': { visible: :all, path: '/' },
            'Codenv.top': { visible: :all, url: 'https://codenv.top/' },
            'Github': { visible: :all, url: 'https://github.com/sbezugliy/trie-viz' },
            'CI status': { visible: :all, url: 'https://cloud.drone.io/sbezugliy/trie-viz' }
        }
      },{
        name: 'on wide screen',
        before_hook: TO_WIDE_SCREEN,
        after_hook: TO_DESKTOP,
        links: {
            'Home': { visible: true, path: '/' },
            'Codenv.top': { visible: :all, url: 'https://codenv.top/' },
            'Github': { visible: :all, url: 'https://github.com/sbezugliy/trie-viz' },
            'CI status': { visible: :all, url: 'https://cloud.drone.io/sbezugliy/trie-viz' }
        }
      }
    ]
  end
end