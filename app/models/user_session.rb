class UserSession < Authlogic::Session::Base
  logout_on_timeout true
  after_save :set_locale
  #def reset_locale
  #  I18n.locale= (I18n.default_locale unless logged_in? && current_user.locale) || current_user.locale
  #end

  #def not_authenticated
  #  redirect_to login_url, :alert => t('master.not_authenticated')
  #end

  def set_locale
    u= UserSession.find.user
    I18n.locale= u ? u.locale : I18n.default_locale
  end

end

