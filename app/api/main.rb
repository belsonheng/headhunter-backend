module API
  class Main < Grape::API
    include ErrorHandler

    prefix :api
    format :json

    helpers do
      def current_user
        # Find token, check if valid

      end
    end

    mount V1::Base

    route :any, '*path' do error! :not_found, 404 end
  end
end