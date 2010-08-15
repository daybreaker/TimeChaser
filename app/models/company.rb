class Company < ActiveRecord::Base
  has_many :projects
  accepts_nested_attributes_for :projects, :allow_destroy => true
  
  def exists?
    self && self.id
  end
end
