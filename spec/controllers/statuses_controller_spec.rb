require "rails_helper"

RSpec.describe StatusesController, :type => :controller do

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

  	let!(:status) { FactoryBot.create(:status) }

    it "renders :show with the correct template" do
      get :show, params: { id: status.id }
      expect(response).to render_template :show
    end

    it "has a valid http status" do
      get :show, params: { id: status.id }
      expect(response).to have_http_status(200)
    end
  end

  context "POST #Create" do

    let!(:params)   {
      {
        name: "Aberta",
        level: 0
      }
    }

    let!(:invalid_params)   {
      {
        name: ""
      }
    }

    it "Creates a valid priority" do
      post :create, params: { status: params }
      expect(response).to redirect_to(Status.last)
    end

    it "does not create a priority" do
      post :create, params: { status: invalid_params }
      expect(response).to render_template(:new)
    end
  end
end
