class DevelopersController < ApplicationController
before_action :authenticate_user!

  def index
    @developers = Developer.all
  end

  def show
    @developer = Developer.find params[:id]
  end
end