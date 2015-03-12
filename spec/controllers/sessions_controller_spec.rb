require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do


  describe "POST #create" do
    context "with valid params" do
      let(:email){"rspectester@tester.com"}
      let(:password){"nswrsso"}
      let(:create_session){post(:create, {'email' => email, 'password' => password})}

      it "assigns @email" do
        create_session
        expect(assigns(:email)).to eq(email)
      end

      it "assigns @password" do
        create_session
        expect(assigns(:password)).to eq(password)
      end

      it "signs in an existing user" do
        create_session
        expect(assigns(:response_code)).to eq(200)
      end

      it "redirects to todos_path" do
        expect(create_session). to redirect_to todos_path
      end
    end # context

  end # describe POST #create

  describe "DELETE #session" do
    let(:email){"rspectester@tester.com"}
    let(:password){"nswrsso"}
    let(:create_session){post(:create, {'email' => email, 'password' => password})}
    let(:delete_session){delete(:destroy)}

    it "deletes a session succesfully" do
      create_session
      delete_session
      expect(assigns(:response_code)).to eq(204)
    end
  end
end #describe sessions controller
