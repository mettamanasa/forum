class PostsController < ApplicationController
 before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
    if params[:search] 
      @posts = Post.search(params[:search]).order("created_at DESC")  
    elsif params[:list_id] 
      @posts = Post.where(list_id: params[:list_id]).order("created_at DESC") 
    else
      @posts = Post.all.order("created_at #{params[:order]}")
    end
  end
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
    end
  end
  def destroy
    @post.destroy
       redirect_to root_path
  end
  private
  def find_post
     @post = Post.find(params[:id])
  end
   def post_params
     params.require(:post).permit(:title, :name, :context, :image, :list_id)
   end   
end
