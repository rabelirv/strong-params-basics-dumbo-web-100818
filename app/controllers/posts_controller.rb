class PostsController < ApplicationController
	before_action :fetch_post, only: [:update, :show, :edit]

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params(:title,:description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  # @post = Post.find(params[:id])
		@post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	end

	private

	def fetch_post
		@post = Post.find(params[:id])
	end

	def post_params(*args)
		params.require(:post).permit(*args)
	end
end
