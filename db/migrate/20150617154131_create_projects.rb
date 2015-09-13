class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :project_id
      t.string :project_name
      t.integer :number_issues

      t.timestamps null: false
    end
  end
end
