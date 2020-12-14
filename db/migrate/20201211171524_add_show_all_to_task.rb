class AddShowAllToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :show_all, :boolean
  end
end
