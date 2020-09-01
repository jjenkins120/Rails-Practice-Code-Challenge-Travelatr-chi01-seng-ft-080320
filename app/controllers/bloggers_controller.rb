class BloggersController < ApplicationController
  before_action :find_blogger, only: [:show, :edit, :update, :destroy]

  def index
    @bloggers = Blogger.all
  end

  def show

    @featured_post = @blogger.posts.max_by do |post_instance|
        post_instance.likes
    end

    @destination_most_posts = @blogger.destinations.max_by(5) do |destination_instance|
        destination_instance.posts.count 
    end
    
  end
  

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)
    if @blogger.valid?
      flash[:success] = "You've created #{@blogger.name}"
      redirect_to blogger_path(@blogger.id)
    else 
      flash[:my_errors] = @blogger.errors.full_messages
      redirect_to new_blogger_path 
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end

end
