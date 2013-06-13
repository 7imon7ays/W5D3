class LinksController < ApplicationController

  def show
    @link = Link.includes(:comments).find(params[:id])
    @comments = @link.comments
    @root_comments = @link.comments.select { |cmt| cmt.parent_id.nil? }
  end

  def new
    @subs = Sub.all
    @default_sub = params[:sub][:id]
    @link = Link.new
  end

  def create
    @link = current_user.links.build(params[:link])

    if @link.save
      redirect_to link_url(@link)
    else
      render :new
    end
  end

end
