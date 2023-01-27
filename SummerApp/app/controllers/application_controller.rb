class ApplicationController < ActionController::Base
  helper_method :current_user

  I18n.default_locale = :es

  def current_user
    @current_user ||= User.first
  end

  def change_lang
    I18n.default_locale = if I18n.default_locale == :es
                            :en
                          else
                            :es
                          end
    redirect_to root_path
  end
end
