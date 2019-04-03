class EventsControllerTest < ActionDispatch::IntegrationTest
  test 'show should return success' do
    get events_path
    assert_response :success
  end
end
