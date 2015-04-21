class FlatsController < ApplicationController
  before_action :find_user, only: [:new, :create, :show, :edit, :update]

  def new
    @flat = Flat.new
  end

  def create
    @flat = @user.flats.new(flat_params)
    if @flat.save
      redirect_to user_flat_path(@flat)
      # vérifier le chemin
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to user_flat_path(@flat)
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :price, :city, :capacity, :availability, :picture)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
