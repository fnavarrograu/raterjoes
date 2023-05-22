# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#  user_id    :integer
#
class Comment < ApplicationRecord

  belongs_to :user

  def commenter
    return User.where({ :id => self.user_id }).at(0)
  end

end
