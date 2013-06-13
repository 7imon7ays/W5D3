class Sub < ActiveRecord::Base
  attr_accessible :name, :moderator_id, :links_attributes, :moderator

  belongs_to :moderator, class_name: User, foreign_key: :moderator_id
  has_many :link_subs
  has_many :links, through: :link_subs

  validates :moderator, presence: true

  accepts_nested_attributes_for :links, :reject_if => :all_blank
end
