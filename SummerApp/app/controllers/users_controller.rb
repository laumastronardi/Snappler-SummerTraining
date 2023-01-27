# frozen_string_literal: true
class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :age)
  end

  def index
    @users = User.all
    @following = User.joins(:given_follows).group('id').select('users.name').count
    @follows = User.joins(:received_follows).group('id').select('users.name').count

    respond_to do |format| # show.html.erb
      format.json { render json: @users.map{|user| user.format_json((@follows[user.id] || 0), (@following[user.id]) || 0)} }
      #format.json { render json: @user.as_json(include: @follows)}
      format.html
    end
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
    @following = User.joins(:given_follows).group('id').select('users.name').count
    @follows = User.joins(:received_follows).group('id').select('users.name').count
    if @follow.blank?
      @user.received_follows.create(follower_id: current_user.id)
    else
      @follow.first.destroy
    end
    turbo_stream.replace 'index', partial: "users/user", locals: { user: @user, follows: @follows, following: @following }
    #redirect_to @user
  end

  def update
    set_user
    @user.update(user_params)
    redirect_to @user
  end

  def edit
    set_user
  end

  def destroy
    set_user
    @user.destroy!
    redirect_to root_path
  end

  def show
    set_user
    @following = @user.received_follows.where(follower_id: current_user.id).present?
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def build_json
  end

end