class Admin::Browser < ActiveRecord::Base
  attr_accessible :user_agent, :uuid
end
