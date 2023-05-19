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
end
