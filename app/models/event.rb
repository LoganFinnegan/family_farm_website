class Event < ApplicationRecord
  has_one_attached :flyer

  # Validations
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :date, presence: true
  validates :location, presence: true
  validates :cost, presence: true

  # Scopes
  scope :upcoming, -> { where("date >= ?", Time.current).order(date: :asc) }
  scope :past, -> { where("date < ?", Time.current).order(date: :desc) }

  # Allowlist attributes for Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[id title description date location cost created_at updated_at]
  end
end
