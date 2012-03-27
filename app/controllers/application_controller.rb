class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  helper :all
  helper_method :current_user_session, :current_user

  def set_locale
    I18n.locale= current_user.try(:locale) || I18n.default_locale
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      flash[:alert]= t('master.session.not_authenticated')
      redirect_to login_url
      return false
    end
    true
  end

  def require_no_user
    if current_user
      store_location
      redirect_to root_url
      return false
    end
    true
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  helper_method :current_user_session, :current_user

  #def current_user_session
  #  return @current_user_session if defined?(@current_user_session)
  #  @current_user_session = UserSession.find
  #  if @current_user_session && @current_user_session.stale?
  #    redirect_to new_user_session_url(:stale => true)
  #    return false
  #  end
  #end
  #

  layout :select_layout

  def select_layout
    "log#{current_user ? "in": "out"}_master"
  end

end
