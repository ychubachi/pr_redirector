# -*- coding: utf-8 -*-
class MediaController < ApplicationController
  active_scaffold :medium do |conf|
    conf.label = "メディア"
    conf.columns = [:id, :title]
  end
end 
