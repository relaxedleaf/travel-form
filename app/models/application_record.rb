class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def show
      @hello = "hello"
  end
  
end
