# -*- coding: utf-8 -*-
class ReferrersController < ApplicationController
  active_scaffold :referrer do |conf|
    conf.label = "参照元一覧"
    conf.columns = [:created_at, :user, :title]
  end
end 
