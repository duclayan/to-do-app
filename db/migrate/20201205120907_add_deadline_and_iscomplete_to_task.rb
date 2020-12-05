class AddDeadlineAndIscompleteToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :deadline, :date
    add_column :tasks, :iscomplete, :boolean
  end
end
