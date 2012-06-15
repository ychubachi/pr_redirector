class HomeController < ApplicationController
  def initialize
    @default_redirect = 'http://aiit.ac.jp/'
  end

  def index
    logger.info '### HomeControllor#index'
    do_redirect # defaulct redirect
  end

  def redirect
    logger.info '### HomeControllor#redirect'
    id = params[:id]
    do_redirect id
  end

  private

  def do_redirect(id = nil)
    logger.info "### HomeController#do_redirect(id=#{id})"

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

    # lookup User from DB
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

    # lookup redirect_to
    redirect_to = nil
    if id == nil then
      logger.info "### default redirect"
      redirect_to = Redirect.where('default_redirect = :flag', {flag: true}).first
    else
      logger.info "### redirect id = #{id}"
      redirect_to = Redirect.where('id = :id',{id: id}).first
    end
    logger.info "### redirect to = #{redirect_to}"

    redirect_url = nil
    if redirect_to && redirect_to.target then
      logger.info "### redirect to #{redirect_to.title}"
      redirect_url = redirect_to.target.url
    else
      logger.info '### unknown redirect is specified. use default.'
      redirect_url = @default_redirect
    end

    # save a new referrer
    referrer = Referrer.new
    referrer.title = referrer_url
    referrer.user = user
    referrer.redirect = redirect_to
    referrer.save

    # redicet
    redirect_to redirect_url
  end
end
