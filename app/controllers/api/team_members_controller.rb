class Api::TeamMembersController < ApplicationController
  respond_to :json

  def index
    @team_members = TeamMember.all
    respond_with @team_members
  end

  def show
    @team_member = TeamMember.find(params[:id])
    respond_with @team_member
  end
end
