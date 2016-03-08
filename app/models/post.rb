class Post < ActiveRecord::Base

  belongs_to :member
  validates :name, presence: true
  validates :text, presence: true

end