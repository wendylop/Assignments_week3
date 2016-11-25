require 'test_helper'

class ListRecipesTest < ActionDispatch::IntegrationTest
  
    include ActiveJob::TestHelper

    test "get recipes list of user" do
      #perform test
      user = users(:one)

      visit users_path

      # is it the right user?
      assert page.has_content? user.first_name

      # is it the right recipe?
      recipe_title = recipe_titles(:one)
      #assert page.has_content?  recipe_title.name

      # test association in database
      assert_equal user.id, recipe_title.user_id
  end
end