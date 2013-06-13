class Link < ActiveRecord::Base
  attr_accessible :uploader_id,
    :uploader, :url, :title, :body, :sub_ids,
    :comments_attributes,
    :votes_attributes

  belongs_to :uploader, class_name: User, foreign_key: :uploader_id
  has_many :link_subs
  has_many :subs, through: :link_subs
  has_many :comments, inverse_of: :link
  has_many :votes, class_name: UserVote

  accepts_nested_attributes_for :comments

  def upvotes
    votes.select { |vote| vote.upvote == true }.count
  end

  def downvotes
    votes.select { |vote| vote.upvote == false }.count
  end

  def popularity
    upvotes - downvotes
  end

end
