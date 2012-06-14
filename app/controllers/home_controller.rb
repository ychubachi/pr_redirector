class HomeController < ApplicationController
  def index
    # get user's uuid id from the cookies.
    uuid = session[:uuid]
    if uuid.to_s == '' then
      puts '### new user'
      uuid = UUIDTools::UUID.random_create.to_s
      session[:uuid] = uuid
    else
      puts '### repeated user'
    end
    puts "### uuid=#{uuid}"

    # lookup the db
    user = User.where('title = :title', {title: uuid}).first_or_initialize
    if user.new_record?
      puts '### create a new user instance and save it.'
      user.title = uuid
      user.save
    else
      puts '### the user already exists.'
    end

    # get referer
    referrer = request.referer
    puts "### referer=#{referrer}"

    # redirect_to 'http://aiit.ac.jp/'
  end
end
