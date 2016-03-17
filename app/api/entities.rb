module API
  module Entities
    class Employer < Grape::Entity
	    expose :id, documentation: { desc: 'Employer Id (auto-generated)' } do |model| model.id.to_s end
	    expose :name, documentation: { desc: 'Name' }
	    expose :contact_info do
	      expose :email, documentation: { desc: 'Email' }
	      expose :address, documentation: { desc: 'Address' }
	      expose :phone, documentation: { desc: 'Phone number' }
	    end
    end
  end
end