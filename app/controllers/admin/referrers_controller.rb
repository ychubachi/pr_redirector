# -*- coding: utf-8 -*-
module Admin
  class ReferrersController < ApplicationController
    active_scaffold :referrer do |conf|
      conf.label = "参照元一覧"
      conf.columns = [:created_at, :user, :user_admin, :redirect]
    end
  end
end
