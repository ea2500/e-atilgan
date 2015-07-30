class Lab < ActiveRecord::Base

	has_many :documents
	has_many :user_labs

	LABS = Lab.all.collect {|lab| [lab.name, lab.id] }

end
