require "rails_helper"

RSpec.describe AnalistsController, :type => :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    sign_in user
  end

  context "GET #Index" do
    it "renders :index view with the valid template" do
      get :index
      expect(response).to render_template :index
    end

    it "has a valid http status" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  context "GET #Show" do
    it "renders :show with the correct template" do
      analist = FactoryBot.create(:user)
      get :show, params: { analist_id: analist.id }
      expect(response).to render_template :show
    end

    it "has a valid http status" do
      analist = FactoryBot.create(:user)
      get :show, params: { analist_id: analist.id }
      expect(response).to have_http_status(200)
    end
  end
end
