class Task < ActiveRecord::Base
  
  validates :summary,
    :length => {
      :minimum => 1,
      :allow_blank => false,
      :message => "needs to be at least 1 character long."
    }

	validates :complete, 
  	:inclusion => {:in =>[true, false]}

  # Returns a list of all tasks that are incomplete and for which the deadline has passed
  def self.overdue
    Task.find(:all,
      :conditions => [
        'complete = ? and deadline < ?', false, Time.now.utc
      ]
    )
  end
  
	# Returns a list of all tasks that have been completed
	def self.complete
  	Task.find(:all,
    	:conditions => [
      	'complete = ?', true
    	]
  	)
	end

end
