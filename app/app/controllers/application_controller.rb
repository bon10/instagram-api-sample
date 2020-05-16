class ApplicationController < ActionController::Base
  OmniAuth.config.logger = Rails.logger
end
