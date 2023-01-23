# frozen_string_literal: true
class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :age)
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end

  def toggle_follow
    @user = User.find(params[:user_id])
    @follow = @user.received_follows.where(follower_id: current_user.id)
    if @follow.blank?
      @user.received_follows.create(follower_id: current_user.id)
    else
      @follow.first.destroy
    end
    redirect_to @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @following = @user.received_follows.where(follower_id: current_user.id).present?
  end
end
