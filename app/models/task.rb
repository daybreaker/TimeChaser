class Task < ActiveRecord::Base
  has_many :subtasks, :class_name => "Task", :as => :taskable
  has_many :notes, :as => :noteable
  has_many :hours
  belongs_to :taskable, :polymorphic => true
  
end
