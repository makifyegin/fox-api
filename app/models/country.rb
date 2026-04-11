class Country < ApplicationRecord
  has_many :regions, dependent: :destroy
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true, length: { is: 2 }
  validate :code_must_be_valid_iso

  private

  def code_must_be_valid_iso
    return if code.blank?
    unless ISO3166::Country.new(code.upcase)
      errors.add(:code, "must be a valid ISO country code")
    end
  end
end