# app/models/page_content.rb
class PageContent < ApplicationRecord
  has_one_attached :hero_image

  validates :slug, presence: true, uniqueness: true
  validates :text_color, inclusion: { in: %w[light dark] }, allow_nil: true
  validates :overlay_opacity, inclusion: { in: 0..100 }, allow_nil: true

  # Convenience: safe getters with sensible defaults
  def overlay_hex
    overlay_color.presence || "#000000"
  end

  def overlay_alpha
    ((overlay_opacity || 40).to_i.clamp(0,100)) / 100.0
  end
end