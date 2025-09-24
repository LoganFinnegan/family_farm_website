class Product < ApplicationRecord
  has_one_attached :image

  # Validations
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Scopes
  scope :in_stock, -> { where("stock > 0") }
  scope :out_of_stock, -> { where(stock: 0) }

  # Helper to check stock status
  def in_stock?
    stock > 0
  end

  # Ransack allowlist
  def self.ransackable_attributes(auth_object = nil)
    %w[id name description price stock created_at updated_at]
  end
end
