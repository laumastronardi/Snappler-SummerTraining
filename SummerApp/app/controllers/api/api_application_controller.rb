module Api
  class ApiApplicationController < ActionController::API 

    def build_json
      {
        user_list: @users,
        follower_list: @follows,
        following_list: @following
      }
    end

  end
end