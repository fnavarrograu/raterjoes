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
end
