class Task < ActiveRecord::Base
  
  validates :summary,
    :length => {
      :minimum => 1,
      :allow_blank => false,
      :message => "needs to be at least 1 character long."
    }

	validates :complete, 
  	:inclusion => {:in =>[true, false]}
  
end
