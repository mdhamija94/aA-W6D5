# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :status, :inclusion => { :in => ['PENDING', 'APPROVED', 'DENIED'] }
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: cat_id)
      .where.not('start_date > :end_date OR end_date < :start_date',
                 start_date: start_date, end_date: end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where('status = \'APPROVED\'')
  end

  def overlapping_pending_requests
    overlapping_requests.where('status = \'PENDING\'')
  end

  def does_not_overlap_approved_requests
    if !overlapping_approved_requests.empty?
      errors[:base] << 'This cat is not available on the selected dates.'
    end
  end

  def approve!
    ActiveRecord::Base.transaction do
      self.status = 'APPROVED'
      self.save!

      overlapping_requests.each do |rental_request|
        rental_request.deny!
      end
    end
  end

  def deny!
    self.status = 'DENIED'
    self.save!
  end

  def self.reset_requests!
      CatRentalRequest.all.each do |rental_request|
        rental_request.update!(status: 'PENDING')
      end
  end
end
