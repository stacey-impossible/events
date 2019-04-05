class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'index should return success' do
    get events_path
    assert_response :success
  end

  test 'show should return success' do
    get event_path(events(:one).id)
    assert_response :success
  end

  test 'new should return success with auth' do
    sign_in organizers(:one)
    get new_event_path
    assert_response :success
  end

  test 'new should not return success without auth' do
    get new_event_path
    assert_redirected_to :new_organizer_session
  end

  test 'create should accept valid params' do
    sign_in organizers(:one)
    assert_difference 'Event.count' do
      post events_path, params: { event: events(:one).attributes }
    end
  end

  test 'should not create event without auth' do
    post events_path, params: { event: events(:one).attributes }
    assert_redirected_to :new_organizer_session
  end

  test 'should not create event with invalid params' do
    sign_in organizers(:one)
    assert_difference 'Event.count', 0 do
      post events_path, params: { event: events(:invalid).attributes }
    end
  end
end
