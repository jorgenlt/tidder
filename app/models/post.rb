class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  acts_as_votable
end
