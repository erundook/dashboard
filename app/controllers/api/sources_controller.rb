class Api::SourcesController < ApplicationController
  respond_to :json

  def index
    @source = Source.all
    respond_with @source
  end

  def show
    @source = Source.find(params[:id])
    respond_with @source
  end
end
