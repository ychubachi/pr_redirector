module Admin
  class UsersController < ApplicationController
    active_scaffold :user do |conf|
    end
  end
end
