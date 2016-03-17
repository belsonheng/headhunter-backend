module API
  module ErrorHandler
    extend ActiveSupport::Concern
    included do
      # global handler for simple not found case
      rescue_from Mongoid::Errors::DocumentNotFound do |error|
        error! "Sorry, we didn't find what we were looking for.", 404
      end
  
      # global handler for Grape validation exception
      rescue_from Grape::Exceptions::ValidationErrors do |error|
        error! error.message, 406
      end

      # global exception handler, used for error notifications
      rescue_from :all do |error|
        # TODO: logging
        error! error.message, 500
      end
    end
  end
end