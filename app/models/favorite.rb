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

  def owner
    return User.where({ :id => self.user_id }).at(0)
  end

  def product
    return Product.where({ :id => self.product_id }).at(0)
  end

end
