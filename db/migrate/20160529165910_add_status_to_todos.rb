class AddStatusToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :status, :integer
  end
end
