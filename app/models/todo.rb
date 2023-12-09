class Todo < ApplicationRecord
    acts_as_list top_of_list: 0
    validates :title, presence: true
    belongs_to :section
    scope :ordered, -> { order(:position) }
end
