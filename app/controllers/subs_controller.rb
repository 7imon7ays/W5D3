class SubsController < ApplicationController

  before_filter :check_login

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def create
    @sub = current_user.subs.build(params[:sub])
    @sub.links.each { |link| link.uploader = current_user }

    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def new
    @creator = current_user
    @sub = Sub.new
  end

  def edit
    @sub = Sub.find(params[:id])
    unless current_user == @sub.moderator
      render :json => "That's not your sub!"
      return
    end
  end

  def update
    @sub = Sub.find(params[:id])
    @sub.update_attributes(params[:sub])

    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
  end

end
