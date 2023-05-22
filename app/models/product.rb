# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  description      :string
#  image            :string
#  price            :float
#  product_category :string
#  product_name     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  owner_id         :integer
#

class Product < ApplicationRecord

  validates :product_name, :uniqueness => { :case_sensitive => false }
  validates :product_name, :presence => true
  validates :price, :presence => true
  validates :description, :presence => true

belongs_to :user

has_many :comments
has_many :ratings

mount_uploader :image, ImageUploader

def average_rating
  ratings.average(:rating)
end

def ratings_count
  ratings.count(:rating)
end

end
