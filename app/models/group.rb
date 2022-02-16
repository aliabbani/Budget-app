class Group < ApplicationRecord
  belongs_to :user
  has_many :entities

  validates :name, :icon, presence: true

  def total_transaction
    entities.sum(:amount)
  end
end
