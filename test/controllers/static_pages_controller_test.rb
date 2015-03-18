require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
   test "index page" do
     get :index
     assert_response :success
   end
end
