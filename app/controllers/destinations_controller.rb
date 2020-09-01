class DestinationsController < ApplicationController
  before_action :find_destination, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show

    @top_five_most_recent = @destination.posts.max_by(5) do |post_instance|
      post_instance.updated_at
    end

    @featured_post = @destination.posts.max_by do |post_instance|
      post_instance.likes
    end

    


  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_destination
    @destination = Destination.find(params[:id])
  end

end
