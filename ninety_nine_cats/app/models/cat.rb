# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = ['brown', 'orange', 'grey', 'black', 'white']

  def self.cat_colors
    COLORS.map(&:capitalize)
  end

  validates :color, inclusion: COLORS
  validates :sex, inclusion: ['M', 'F']
  validates :name, :color, :sex, :birth_date, :description, presence: true

  def age
    time_ago_in_words(self.birth_date)
  end

  has_many :cat_rental_requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
end
