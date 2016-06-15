class DevelopersController < ApplicationController

  def index
    @developers = Developer.first(10)
  end

  def show
    @developer = Developer.find(params[:id])
end
