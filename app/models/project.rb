class Project < ActiveRecord::Base
  belongs_to :company
  has_many :tasks, :as => :taskable
  has_many :notes, :as => :noteable

  def items
    tasks + notes
  end

end