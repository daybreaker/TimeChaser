class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.text :desc
      t.string :status
      t.date :due_date
      t.integer :estimated_hours
      t.string :url
      t.integer :order
      t.integer :parent_id
      t.string :parent_type

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
