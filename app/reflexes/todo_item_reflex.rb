# frozen_string_literal: true

class TodoItemReflex < ApplicationReflex

  def mark_complete
    todo_item = TodoItem.find(element.dataset.id)
    todo_item.update(completed: true, complited_at: Time.now)
  end

  def mark_incomplete
    todo_item = TodoItem.find(element.dataset.id)
    todo_item.update(completed: false, complited_at: nil)
  end
end
