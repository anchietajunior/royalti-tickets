require "rails_helper"

RSpec.describe CustomersController, :type => :controller do

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
      customer = FactoryBot.create(:customer)
      get :show, params: { id: customer.id }
      expect(response).to render_template :show
    end

    it "has a valid http status" do
      customer = FactoryBot.create(:customer)
      get :show, params: { id: customer.id }
      expect(response).to have_http_status(200)
    end
  end

  context "POST #Create" do

    let!(:params)   {
      {
        name: "Zezinho da padaria"
      }
    }

    let!(:invalid_params)   {
      {
        name: ""
      }
    }

    it "Creates a valid customer" do
      post :create, params: { customer: params }
      expect(response).to redirect_to(Customer.last)
    end

    it "does not create a customer" do
      post :create, params: { customer: invalid_params }
      expect(response).to render_template(:new)
    end
  end
end
