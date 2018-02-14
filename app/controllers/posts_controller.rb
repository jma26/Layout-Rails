class PostsController < ApplicationController
  layout "three_column"
  def index
    @posts = Post.all
    @authors = User.all.select('first_name', 'last_name')
  end
  def create
    Post.create(post_params)
    redirect_to '/post'
  end
  private
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end
