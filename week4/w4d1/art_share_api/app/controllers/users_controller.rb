class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    @users = User.all
    render json: @users
  end

  def create
    user = User.new(user_params)
    # user = User.new(params.require(:user).permit(:name, :email))
    if user.save
      render json: params
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def update
    user = User.find_by(:id params[:id])

    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if user.destroy
      render json: user
    else
      render json: "Can't destroy this user, too important"
    end
  end

  def user_params
    params[:user].permit(:name, :email)
  end
end
