class PagesController < ApplicationController
  def home
    @developers = User.joins(:resume).first(10)
  end
end
