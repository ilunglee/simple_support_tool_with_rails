class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :email
      t.text :description
      t.string :department

      t.timestamps
    end
    add_index :tickets, [:title, :description, :email, :department]
  end
end
