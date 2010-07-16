class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.string :url
      t.string :status
      t.date :due_date
      t.integer :order
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
