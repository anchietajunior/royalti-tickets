require "rails_helper"

RSpec.describe PrioritiesController, :type => :controller do

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
      priority = FactoryBot.create(:priority)
      get :show, params: { id: priority.id }
      expect(response).to render_template :show
    end

    it "has a valid http status" do
      priority = FactoryBot.create(:priority)
      get :show, params: { id: priority.id }
      expect(response).to have_http_status(200)
    end
  end

  context "POST #Create" do

    let!(:params)   {
      {
        name: "Prioridade alta",
        level: 0
      }
    }

    let!(:invalid_params)   {
      {
        name: ""
      }
    }

    it "Creates a valid priority" do
      post :create, params: { priority: params }
      expect(response).to redirect_to(Priority.last)
    end

    it "does not create a priority" do
      post :create, params: { priority: invalid_params }
      expect(response).to render_template(:new)
    end
  end
end
