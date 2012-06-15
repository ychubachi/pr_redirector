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

    # record
    id = params[:id]
    logger.info "### id=#{id}"

    redirect = Redirect.where('id = :id',{id: id}).first
    if redirect && redirect.target then
      url = redirect.target.url
    else
      logger.info '### no target is specified.'
    end

    if url
      logger.info "### redirect to #{url}"
      redirect_to url
    else
      logger.info "### redirect to default url"
      # TODO: error should be recoded
      redirect_to @default_redirect
    end
  end

  private

  def record
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
      logger.info '### the user already exists.'
    end

    # get referrer
    referrer_url = request.referer
    logger.info "### referer=#{referrer_url}"
    referrer = Referrer.new
    referrer.title = referrer_url
    referrer.user = user
    referrer.save
  end
end
