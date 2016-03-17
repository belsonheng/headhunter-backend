module API
  module V1
    class Base < Grape::API
      # Mount API endpoints
	  mount Employers
	  
	  # Add API documentation
	  add_swagger_documentation mount_path: "v1/documentation",
	                            #base_path: "/api",
								api_version: 'v1',
	                            info: 
								{ title: "Headhunter API", 
								  description: "This is the Headhunter backend server." 
								},
	                            hide_documentation_path: true,
								hide_format: true
	end
  end
end