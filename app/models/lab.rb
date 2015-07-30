class Lab < ActiveRecord::Base

	has_many :documents

	LABS = Lab.all.collect {|lab| [lab.name, lab.id] }

end
