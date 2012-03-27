class HomeController < ApplicationController
  before_filter :require_user

  def index
    if current_user.role == :counselor

      redirect_to edit_exam_path Exam.last.id

   # elsif current_user.role == :student


    end


  end

  def secret

  end

  def create

  end
  def finish

  end

end
