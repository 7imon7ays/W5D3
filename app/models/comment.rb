class Comment < ActiveRecord::Base
  attr_accessible :link_id, :parent_id, :body, :author_id, :link

  belongs_to :author, class_name: User, foreign_key: :author_id
  belongs_to :link
  belongs_to :parent, class_name: Comment, foreign_key: :parent_id,
    primary_key: :id
  has_many :children, class_name: Comment, foreign_key: :parent_id,
    primary_key: :id
end
