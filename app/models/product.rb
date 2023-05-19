# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  average_rating :float
#  description    :string
#  image          :string
#  price          :float
#  product_name   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Product < ApplicationRecord

  validates :product_name, :uniqueness => { :case_sensitive => false }
  validates :product_name, :presence => true
  validates :price, :presence => true
  validates :description, :presence => true

belongs_to :user

has_many :comments
has_many :ratings

end
