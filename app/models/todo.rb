class Todo < ActiveRecord::Base

  validates :description, presence: true
  enum status: [:completed, :incomplete]
end
