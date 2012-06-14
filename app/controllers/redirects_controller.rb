# -*- coding: utf-8 -*-
class RedirectsController < ApplicationController
  active_scaffold :redirect do |conf|
    conf.label = "リダイレクト一覧"
    conf.columns = [:id, :medium, :target]
  end
end 
