class Api::V1::SourcesController < ApplicationController
  respond_to :json

  def index
    respond_with Source.all
  end

  def show
    respond_with Source.find(params[:id])
  end
end
