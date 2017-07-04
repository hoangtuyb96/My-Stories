class SearchesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :search_story, only: :index

  def index
    @title = params[:query]
  end

  private

  def search_story
    @story ||= Story.search params[:query] if params[:query]
  end
end
