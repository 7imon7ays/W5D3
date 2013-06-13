class LinksController < ApplicationController

  def show
    @link = Link.includes(:comments).find(params[:id])
    @comments = @link.comments
    @root_comments = @link.comments.select { |cmt| cmt.parent_id.nil? }
  end

  def new
    @subs = Sub.all
    @default_sub_id = params[:sub][:id].to_i
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

  def upvote
    @vote = current_user.votes.build(params[:votes_attributes])
    @vote.link_id = params[:link_id]
    if @vote.save
      redirect_to link_url(params[:link_id])
    else
      flash[:errors] ||= @vote.errors.full_messages.to_sentence
      redirect_to link_url(params[:link_id])
    end
  end

  def downvote
    @vote = current_user.votes.build(params[:votes_attributes])
    @vote.link_id = params[:link_id]
    if @vote.save
      redirect_to link_url(params[:link_id])
    else
      flash[:errors] ||= @vote.errors.full_messages.to_sentence
      redirect_to link_url(params[:link_id])
    end
  end

end
