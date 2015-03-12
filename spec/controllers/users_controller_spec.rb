require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "POST #create" do
    context "with valid params" do
      let(:email){Faker::Internet.email}
      let(:password){Faker::Lorem.characters(8)}
      let(:create_user){post(:create, {'email' => email, 'password' => password})}


      it "assigns @email" do
        create_user
        expect(assigns(:email)).to eq(email)
      end

      it "assigns @password" do
        create_user
        expect(assigns(:password)).to eq(password)
      end


      it "creates a user" do
        create_user
        expect(assigns(:response_code)).to eq(200)
      end

      it "redirects to create_session_path" do
        expect(create_user).to redirect_to create_session_path({email: email, password: password})
      end
    end # context with valid params

    context "with invalid params" do
      let(:email){"rspectester@tester.com"}
      let(:password){Faker::Lorem.characters(8)}
      let(:create_user){post(:create, {'email' => email, 'password' => password})}


      it "does not create an existing user and throws response code 400" do
        create_user
        expect(assigns(:response_code)).to eq(400)
      end
    end # context with invalid params

  end # describe POST #create

end


