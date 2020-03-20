class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(hero_params)
    @heroine.save

    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:message] = "Create failed"
      redirect_to new_heroine_path
    end
  end

  private 

  def hero_params
  # params.require().permit
  params.require(:heroine).permit(:name,:super_name)
  end

end
