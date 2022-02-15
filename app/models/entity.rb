class Entity < ApplicationRecord
  belongs_to :user
  has_many :groups

  validates :name, :amount, presence: true
end
