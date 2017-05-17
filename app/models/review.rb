class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates_associated :product
  validates_associated :user
  validates :user_id, :description, presence: true
  validates :rating, :inclusion => { :in => [1, 2, 3, 4, 5] }, allow_nil: true
end
