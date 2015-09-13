class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :ticket_id
      t.string :title
      t.text :description
      t.string :task_type
      t.string :status
      t.string :priority
      t.integer :estimate
      t.integer :time_spent
      t.integer :progress
      t.string :assignee
      t.integer :project_id
      t.integer :developer_id

      t.timestamps null: false
    end
  end
end
