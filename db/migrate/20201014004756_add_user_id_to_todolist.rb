class AddUserIdToTodolist < ActiveRecord::Migration[6.0]
  def change
    change_table :todo_lists do |t|
      t.belongs_to :user
    end
  end
end
