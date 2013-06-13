class UserVote < ActiveRecord::Base
  attr_accessible :voter_id, :link_id, :upvote

  validates :voter_id, uniqueness: { scope: :link_id }
  validates :voter_id, :link_id, presence: true

  belongs_to :voter, class_name: User, foreign_key: :voter_id
  belongs_to :link

  def upvote?
    upvote
  end

end
