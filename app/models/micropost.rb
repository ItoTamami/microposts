class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true #add L7.8
  validates :content, presence: true, length: { maximum: 140 } #add L7.8
end
