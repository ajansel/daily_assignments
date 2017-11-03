class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    CatRentalRequest.where("? IS BETWEEN start_date AND end_date
      OR ? IS BETWEEN start_date AND end_date", self.start_date, self.end_date)
  end
end
