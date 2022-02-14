class Group < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :entities, through: :entities_groups

    validates :name, :icon, presence: true
end
