# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  rating     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#  user_id    :integer
#
class Rating < ApplicationRecord

belongs_to :product
belongs_to :user

def rater
  return User.where({ :id => self.user_id }).at(0)
end

def product

  return Product.where({ :id => self.product_id }).at(0)

end

end
