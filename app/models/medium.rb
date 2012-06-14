class Medium < ActiveRecord::Base
  attr_accessible :category, :copies, :cost, :end_date, :start_date, :title, :media_id
end
