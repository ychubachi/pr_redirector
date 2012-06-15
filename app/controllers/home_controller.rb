class HomeController < ApplicationController
  def initialize
    @default_redirect = 'http://aiit.ac.jp/'
  end

  def index
    logger.info '### HomeControllor#index'
    record
    redirect_to @default_redirect
  end

  def redirect
    logger.info '### HomeControllor#redirect'

    id = params[:id]
    logger.info "### id=#{id}"

    redirect_to = Redirect.where('id = :id',{id: id}).first
    redirect_url = @default_redirect
    if redirect_to && redirect_to.target then
      redirect_url = redirect_to.target.url
    else
      logger.info '### no target is specified.'
    end
    logger.info "### redirect to #{redirect_url}"

    # record
    record redirect_to
    redirect_to redirect_url
  end

  private

  def record(redirect_to = nil)
    logger.info "### Home#record(redirect_to=#{redirect_to})"
    # get user\'s uuid id from the session.
    uuid = session[:uuid]
    if uuid.to_s == '' then
      logger.info '### new user'
      uuid = UUIDTools::UUID.random_create.to_s
      session[:uuid] = uuid
    else
      logger.info '### repeated user'
    end
    logger.info "### uuid=#{uuid}"

    # lookup the db
    user = User.where('title = :title', {title: uuid}).first_or_initialize
    if user.new_record?
      logger.info '### create a new user instance and save it.'
      user.title = uuid
      user.save
    else
      logger.info '### the user already exists in DB.'
    end

    # get referrer
    referrer_url = request.referer
    logger.info "### referer=#{referrer_url}"

    # save a new referrer
    referrer = Referrer.new
    referrer.title = referrer_url
    referrer.user = user
    referrer.redirect = redirect_to
    referrer.save
  end
end
