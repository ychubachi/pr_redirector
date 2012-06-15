# -*- coding: utf-8 -*-
module Admin
  class RedirectsController < ApplicationController
    active_scaffold :redirect do |conf|
      conf.label = "リダイレクト一覧"
      conf.columns = [:id, :medium, :target]
    end
  end
end
