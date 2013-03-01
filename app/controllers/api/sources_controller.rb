class Api::SourcesController < ApplicationController
  respond_to :json

  def index
    @sources = Source.all
    respond_with @sources
  end

  def show
    @source = Source.find(params[:id])
    respond_with @source
  end
end
