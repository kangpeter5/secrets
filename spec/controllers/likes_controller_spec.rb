require 'rails_helper'

RSpec.describe LikesController, type: :controller do
	before do
       @user = create_user
       @wrong_user = create_user
       @secret = @user.secrets.create(body: 'I am a hippo')
       @likes = Like.create(user: @user , secret: @secret)
       session[:user_id] = @wrong_user.id
   	end
   	describe "when not logged in" do

     	it "cannot create a like for another user" do
         	post :create 
         	expect(response).to redirect_to("/sessions/new")
     	end

     	it "cannot destroy a like for another user" do
         	delete :destroy, id: @likes.id
         	expect(response).to redirect_to("/sessions/new")
     	end
   	end
end
