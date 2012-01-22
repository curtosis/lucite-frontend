class ProducingCompany < ActiveRecord::Base

	def self.name_from_code(code)
		where('code' => code).first.display_name
	end
end
