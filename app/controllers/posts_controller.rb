class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  before_action :move_to_index, except: [:index, :new, :create]

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def edit
  end
  
  
  def create
    @post = Post.new(post_params)  
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def update

  end
  
  def destroy

  end
  
  private
  
  
 
  def post_params
    params.require(:post).permit(:title, :body, :image).merge(user_id: current_user.id)
  end
end