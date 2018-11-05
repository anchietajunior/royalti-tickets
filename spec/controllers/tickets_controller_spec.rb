require "rails_helper"

RSpec.describe TicketsController, :type => :controller do

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
      ticket = FactoryBot.create(:ticket)
      get :show, params: { id: ticket.id }
      expect(response).to render_template :show
    end

    it "has a valid http status" do
      ticket = FactoryBot.create(:ticket)
      get :show, params: { id: ticket.id }
      expect(response).to have_http_status(200)
    end
  end

  context "POST #Create" do

    let!(:customer) { FactoryBot.create(:customer) }
    let!(:priority) { FactoryBot.create(:customer) }
    let!(:user)     { FactoryBot.create(:customer) }
    let!(:status)   { FactoryBot.create(:status, level: 0) }

    let!(:params)   {
      {
        description: "NF nao emitida",
        customer_id: customer.id,
        priority_id: priority.id,
        user_id:     user.id
      }
    }

    it "has a 200 http status" do
      post :create, params: { ticket: params }
      expect(response).to have_http_status(200)
    end
  end
end
