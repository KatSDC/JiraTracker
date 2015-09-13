class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :developer_name
      t.string :developer_email
      t.integer :num_tickets

      t.timestamps null: false
    end
  end
end
