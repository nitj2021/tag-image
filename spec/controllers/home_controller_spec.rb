require 'spec_helper'

describe HomeController, :type => :controller  do
   #fixtures :user
   include Devise::TestHelpers
   render_views

     setup :login
    it "go to root path" do
      get :index
      assert_response :success

  end

end