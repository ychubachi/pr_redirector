class HomeController < ApplicationController
  def initialize
    @default_redirect = 'http://aiit.ac.jp/'
  end

  def index
    puts '### HomeControllor#index'
    record
    redirect_to @default_redirect
  end

  def redirect
    puts '### HomeControllor#redirect'
    puts "### params=#{params.to_s}"

    # record
    id = params[:id]
    puts "### =#{id}"

    redirect = Redirect.where('id = :id',{id: id}).first
    # url = nil
    if redirect && redirect.target then
      url = redirect.target.url
    else
      puts '### no target is specified.'
    end

    if url
      puts "### redirect to #{url}"
      redirect_to url
    else
      # TODO: error should be recoded
      redirect_to @default_redirect
    end
      
  end

  private

  def record
    # get user\'s uuid id from the session.
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

    # get referrer
    referrer_url = request.referer
    puts "### referer=#{referrer_url}"
    referrer = Referrer.new
    referrer.title = referrer_url
    referrer.user = user
    referrer.save
  end
end
