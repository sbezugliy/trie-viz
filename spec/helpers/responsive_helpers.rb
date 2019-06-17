module ResponsiveHelpers

  extend self

  TO_MOBILE      = lambda{resize_window_to_mobile}
  TO_TABLET      = lambda{resize_window_to_tablet}
  TO_DESKTOP     = lambda{resize_window_to_default}
  TO_WIDE_SCREEN = lambda{resize_window_to_wide}

  def resize_window_to_mobile
    resize_window_by(640, 480)
  end

  def resize_window_to_tablet
    resize_window_by(960, 640)
  end

  def resize_window_to_default
    resize_window_by(1280, 1024)
  end

  def resize_window_to_wide
    resize_window_by(1920, 1080)
  end

  private

  def resize_window_by(width, height)
    return unless Capybara.current_session.driver.browser.respond_to? 'manage'
    Capybara.current_session.driver.browser.manage.window.resize_to(width, height) 
  end

end