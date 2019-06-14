module ResponsiveHelpers

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
    Capybara.current_session.driver.browser.manage.window.resize_to(width, height) if Capybara.current_session.driver.browser.respond_to? 'manage'
  end

end