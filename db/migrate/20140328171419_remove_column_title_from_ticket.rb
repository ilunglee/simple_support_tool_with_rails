class RemoveColumnTitleFromTicket < ActiveRecord::Migration
  def change
    remove_column :tickets, :title, :string
    add_column :tickets, :name, :string
  end
end
