require "rails_helper"

RSpec.describe SearchesController, type: :controller do
  describe "GET #index" do
    it "redirect to search" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
