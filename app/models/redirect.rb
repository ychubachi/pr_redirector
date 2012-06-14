class Redirect < ActiveRecord::Base
  attr_accessible :medium_id, :target_id
  belongs_to :medium
  belongs_to :target
end
