class DevelopersController < ApplicationController
<<<<<<< HEAD

  def index
    @developers = Developer.first(10)
  end

  def show
    @developer = Developer.find(params[:id])
=======
def index
  @users = User.all

end


>>>>>>> 1fe8d01a0936ee37351857a0b3422ec5505130a6
end
