module Api
  class UsersApiController < Api::ApiApplicationController
    def user_params
      params.permit(:name, :age)
    end

    def index
      @users = User.all
      @following = User.joins(:given_follows).group('id').select('users.name').count
      @follows = User.joins(:received_follows).group('id').select('users.name').count
      render json: build_json
    end

    def create
      @user = User.new(user_params)
      @user.save
      render json: @user
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      render json: @user
    end
  end
end
