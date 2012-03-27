class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only=> :new

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice]= t('master.session.login')
      redirect_back_or_default root_url
    else
      flash[:error]= t('master.session.failure')
      redirect_to login_url
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice]= t('master.session.logout')
    redirect_to login_url
  end

  def last_request_update_allowed?
    !%W(index timeout).include?(action_name)
  end

  def index
    last_time = current_user_session.try(:user).try(:last_request_at)
    unless last_time
      render :json=> nil
      return
    end
    remaining= last_time - Time.now.in_time_zone + AppConfig['session_timeout']['session_wait'].to_i.seconds
    render :json=>{last_time: last_time, session_timeout: remaining,
                   popup_timeout: remaining- AppConfig['session_timeout']['popup_wait'].to_i.seconds}
  end

  def edit
    render :json=> current_user_session.try(:user).try(:last_request_at)
  end

  def timeout
    render :timeout, layout: false
  end
end
