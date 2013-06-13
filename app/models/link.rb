class Link < ActiveRecord::Base
  attr_accessible :uploader_id,
    :uploader, :url, :title, :body, :sub_ids, :comments_attributes

  belongs_to :uploader, class_name: User, foreign_key: :uploader_id
  has_many :link_subs
  has_many :subs, through: :link_subs
  has_many :comments, inverse_of: :link

  accepts_nested_attributes_for :comments
end
