
require 'spec_helper'

describe PhotoController, :type => :controller  do

   include Devise::TestHelpers
    render_views
     setup :login
   it "should get index" do
     get :index ,:id=>1
     assert_response :success
   end

   it "should get new" do
     get :new ,:id=>1
     assert_response :success
   end

   it "should get create" do
     post :create,:id=>"1"
     assert_redirected_to "/photo?id=1"
   end

   it "should get delete" do
     assert_difference "Photo.count", -1 do
        delete :destroy,:id=>1
   end

   end
   it "should get show" do
      get :show ,:id=>1
      assert_response :success
    end


end