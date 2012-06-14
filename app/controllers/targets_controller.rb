# -*- coding: utf-8 -*-
class TargetsController < ApplicationController
  active_scaffold :target do |conf|
    conf.label = "対象"
    conf.columns = [:title, :url]
  end
end 
