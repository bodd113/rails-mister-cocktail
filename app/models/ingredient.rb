class Ingredient < ApplicationRecord
  before_destroy :check_for_cocktails
  has_many :doses
  has_many :cocktails, through: :doses
  validates :name, uniqueness: true, presence: true

  private

  def check_for_cocktails
    if cocktails.count > 0
      # errors.add_to_base("cannot delete ingredient which is used in a cocktail")
      return false
    end
  end

end
