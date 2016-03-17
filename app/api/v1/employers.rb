module API
  module V1
    class Employers < Grape::API
	  version 'v1' # path-based versioning by default
	
	  resource :employers, desc: 'Operations about employers' do

	    desc 'List all employers.'
	    params { optional :name, type: String, desc: 'Employer name to filter on' }
	    get do
		  present params[:name] ? Employer.find_by(name: params[:name]) 
							    : Employer.all,
		  with: Entities::Employer
	    end
	  
	    desc 'Add an employer.'
	    params { requires :none, except: [:name, :email], using: Entities::Employer.documentation.except(:id) }
	    post do
		  employer = Employer.create!(declared(params, include_missing: false))
		  present :success, "#{employer.name} is created with id #{employer.id}."
	    end
	  
	    desc 'Update an employer.'
	    params { requires :none, except: [:id], using: Entities::Employer.documentation.except(:name) }
	    put ':id' do
		  employer = Employer.find(params[:id])
		  employer.update_attributes!(declared(params, include_missing: false))
		  present :success, "#{employer.name} is updated."
	    end
	  
	    desc 'Delete an employer.'
	    params do 
	      requires :none, except: [:id], using: Entities::Employer.documentation.select { |k, _| k == :id }
	    end
	    delete ':id' do
		  employer = Employer.find(params[:id])
		  employer.destroy!
		  present :success, "#{employer.name} is deleted."
	    end
	  end
    end
  end
end