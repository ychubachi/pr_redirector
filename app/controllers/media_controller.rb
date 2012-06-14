# -*- coding: utf-8 -*-
class MediaController < ApplicationController
  active_scaffold :medium do |conf|
    conf.label = "広告媒体一覧"
    conf.columns = [:title, :code, :category, :start_date, :end_date, :cost, :copies]
  end
end 
