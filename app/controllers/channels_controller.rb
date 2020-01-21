class ChannelsController < ApplicationController
  before_action :require_login

  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find_by(id: params[:id])
    @shows = @channel.shows
  end
end
