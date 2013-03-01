class Api::V1::StoriesController < ApplicationController
  respond_to :json

  def index
    respond_with Story.all
  end

  def show
    respond_with Story.find(params[:id])
  end
end
