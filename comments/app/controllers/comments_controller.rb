class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json

  before_filter :authenticate_user!
  def index
    @messages = Type.all
      # @comments = Comment.all

     if params[:id] != nil

      @translate= translate
      redirect_to comments_path
      end
      @comments = Comment.paginate :per_page => 5, :page => params[:page], :order => "created_at DESC"


    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show


    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    #@comment = Comment.find(params[:id])
    @comment = Comment.find(params[:id])

  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new
    @comment.message = params[:message]
    @comment.translating = params[:translating]
    @comment.tag_id = params[:tag_id]
    @comment.type_id = params[:type_id]
    @comment.user_id=current_user.id
    @comment.hiding = true
    @comment.report = false


    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, :notice => 'Comment was successfully created.' }
        format.json { render :json => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @comment.message = params[:message]
    @comment.translating = params[:translating]
    @comment.tag_id = params[:tag_id]
    @comment.type_id = params[:type_id]
    @comment.user_id=current_user.id

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, :notice => 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  def filter
     type_id= params[:type_id]
    @comments= Comment.find_all_by_type_id(type_id)

    render :action=> :index
  end

  def myPage
  @comments = Comment.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html
      format.json { render :json => @comment }
    end
  end

  def myPageFilter

     type_id= params[:type_id]
    @comments= Comment.where(:type_id => type_id, :user_id => current_user.id)
    render :action=> :myPage
  end

  def hide

    @comment = Comment.find(params[:id])
    @comment.hiding = false
    @comment.update_attributes(params[:comment])
    redirect_to mypage_path
    #render :action=> :myPage

  end

  def unhide

    @comment = Comment.find(params[:id])
    @comment.hiding = true
    @comment.update_attributes(params[:comment])
    redirect_to mypage_path

  end

  def reporting

    @comment = Comment.find(params[:id])
    @comment.report = true
    @comment.update_attributes(params[:comment])
    redirect_to comments_path

  end

  def unreporting

    @comment = Comment.find(params[:id])
    @comment.report = false
    @comment.update_attributes(params[:comment])
    redirect_to comments_path

  end


   def translate


    return Comment.find(params[:id]).translating





   end

   def untranslate

    redirect_to comments_path

  end


end
