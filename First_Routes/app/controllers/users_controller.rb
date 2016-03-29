
class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def show
    this_user = User.find_by(id: params[:id])

    render json: this_user
    :unprocessable_entity

  end

  def update

    this_user = User.find_by(id: params[:id])

    if this_user.update(user_params)
      render json: this_user
    else
      render(
        json: this_user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    this_user = User.find_by(id: params[:id])

    if this_user.delete
      render json: this_user
    else
        :unprocessable_entity

    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
