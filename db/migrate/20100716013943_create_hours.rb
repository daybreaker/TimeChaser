class CreateHours < ActiveRecord::Migration
  def self.up
    create_table :hours do |t|
      t.integer :minutes
      t.integer :task_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hours
  end
end
