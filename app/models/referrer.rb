class Referrer < ActiveRecord::Base
  attr_accessible :title
  belongs_to :user
  belongs_to :redirect

  def user_admin
    return user.admin
  end
end
