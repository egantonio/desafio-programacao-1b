require 'test_helper'

class DadosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dados_index_url
    assert_response :success
  end

end
