class Todo < ActiveRecord::Base
    validates :description, presence: true
    enum status: [:completed, :incomplete]
    belongs_to :user
end
