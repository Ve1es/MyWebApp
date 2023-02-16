# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    render 'pages/index'
    @name = params[:name]
  end
end
