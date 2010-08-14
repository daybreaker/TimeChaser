class Task < ActiveRecord::Base
  has_many :subtasks, :class_name => "Task", :as => :taskable
  has_many :notes, :as => :noteable
  has_many :hours
  belongs_to :taskable, :polymorphic => true
  
  attr_accessor :is_subtask, :parent_task_id
  
  def parent_project
    if taskable_type == "Project"
      taskable
    elsif taskable_type == "Task"
      taskable.taskable
    else
      nil
    end
  end
  
  def items
    subtasks + notes
  end
  
  def subtask?
    taskable_type == "Task"
  end
end
