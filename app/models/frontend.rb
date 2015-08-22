class Frontend < Settingslogic
  source Rails.root.join('config/settings/frontend.yml')
  namespace Rails.env
  suppress_errors true

  def callback
    URI.join(base_url, callback_path).to_s
  end
end
