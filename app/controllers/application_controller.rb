class ApplicationController < ActionController::Base
  protect_from_forgery
  Time.zone = 'Eastern Time (US & Canada)'
end
