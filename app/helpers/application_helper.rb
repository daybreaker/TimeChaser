module ApplicationHelper
  def companies
    Company.find(:all)
  end
end
