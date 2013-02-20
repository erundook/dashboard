class Api::StoriesController < ApplicationController
  respond_to :json

  def index
    @stories = Story.all
    respond_with @stories
  end

  def show
    @story = Story.find(params[:id])
    respond_with @story
  end
end
