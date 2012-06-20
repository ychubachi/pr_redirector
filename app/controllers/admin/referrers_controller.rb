# -*- coding: utf-8 -*-
module Admin
  class ReferrersController < ApplicationController
    active_scaffold :referrer do |conf|
      conf.label = "参照元一覧"
      conf.list.columns = [:created_at, :title, :user, :user_admin, :redirect]
      conf.list.sorting = {created_at: 'DESC'}
      conf.actions.exclude :create
      conf.actions.exclude :update
      conf.actions.exclude :show
    end
  end
end
