class PostsController < ApplicationController

    def create
        post = Post.new(post_params)
        if post.save
            render json: post, status: :ok
        else 
            render json: post.errors, status: :not_acceptable
        end 
    end 

    def index_by_school
        user = current_user
        school = user.school
        posts = []
        school.users.each do |user|
            user.posts.each do |post|
                posts << post
            end
        end
        posts = posts.sort { |a,b| b.created_at <=> a.created_at }
        render json: posts, status: :ok
    end


    def post_params
        params.require(:post).permit(:title, :user_id, :body)
    end
end
