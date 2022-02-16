class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, :amount, presence: true

  def total_transaction
    groups.entities.sum('amount')
  end
end
