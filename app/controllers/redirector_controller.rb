require 'uuidtools'

class RedirectorController < ApplicationController
  def index
    # get prospective customer id from the cookies.
    pcid = cookies[:pcid]
    if pcid == nil then
      puts 'create new pcid'
      uuid = UUIDTools::UUID.random_create
      puts uuid
      cookies[:pcid] = uuid
    else
      puts 'welcome again'
    end
    # redirect_to "http://aiit.ac.jp/"
  end
end
