require 'date'
# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: ['black', 'white', 'gray', 'brown', 'calico'] }
  validates :sex, inclusion: { in: ['M', 'F'] }, length: { maximum: 1}

  def age
    (Date.today - birth_date).fdiv(365).floor #ASK!!
  end

  has_many :rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
end
