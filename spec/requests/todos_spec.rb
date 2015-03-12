require 'rails_helper'

RSpec.describe "Todos", :type => :request do

  let(:email){"rspectester@tester.com"}
  let(:password){"nswrsso"}
  let(:create_session){post "/sessions", {'email' => email, 'password' => password}}
  let(:create_todo){post "/todos", {'description' => 'a new todo description'}}
  let(:update_todo){post "/todos", {'todo_id' => '2008', 'description' => 'updated todo', is_complete: 'true'}}



  describe "GET /todos" do

    it "signs in existing user successfully" do
      create_session
      expect(assigns(:response_code)).to eq(200)
    end

    it "creates a todo successfully" do
      create_session
      create_todo
      expect(assigns(:response_code)).to eq(200)
    end

    it "updates a todo successfully" do
      create_session
      update_todo
      expect(assigns(:response_code)).to eq(200)
    end

  end #describe GET /todos
end

