class AutocompleteController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @story_json = Story.all.select :name
    render json: @story_json
  end
end
