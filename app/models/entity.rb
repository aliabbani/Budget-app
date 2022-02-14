class Entity < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :groups, through: :entities_groups

    validates :name, :amount, presence: true
end
