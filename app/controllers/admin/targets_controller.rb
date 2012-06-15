# -*- coding: utf-8 -*-
module Admin
  class TargetsController < ApplicationController
    active_scaffold :target do |conf|
      conf.label = "対象"
      conf.columns = [:title, :url]
    end
  end
end
