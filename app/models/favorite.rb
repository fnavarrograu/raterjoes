# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#  user_id    :integer
#
class Favorite < ApplicationRecord

belongs_to :product
belongs_to :user

validates :product, presence: true

  def owner
    return User.where({ :id => self.user_id }).at(0)
  end

  def product
    Product.find_by(id: self.product_id)
  end

  def price
    return Product.price.where({ :id => self.product_id }).at(0)
  end

end
