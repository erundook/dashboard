class Api::V1::TeamMembersController < ApplicationController
  respond_to :json

  def index
    respond_with TeamMember.all
  end

  def show
    respond_with TeamMember.find(params[:id])
  end
end
