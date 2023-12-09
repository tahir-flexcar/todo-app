class Todo < ApplicationRecord
    validates :title, presence: true
    belongs_to :section
end
