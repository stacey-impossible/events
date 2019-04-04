class EventsControllerTest < ActionDispatch::IntegrationTest
  test 'index should return success' do
    get events_path
    assert_response :success
  end

  test 'show should return success' do
    get event_path(events(:one).id)
    assert_response :success
  end
end
