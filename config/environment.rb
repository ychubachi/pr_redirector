# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
PrRedirector::Application.initialize!

Rails.logger = Log4r::Logger.new("PR Redirector Log")
