require 'test_helper'

class VenuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venue = venues(:one)
  end

  test "should get index" do
    get venues_url
    assert_response :success
  end

  test "should get new" do
    get new_venue_url
    assert_response :success
  end

  test "should create venue" do
    assert_difference('Venue.count') do
      post venues_url, params: { venue: { about: @venue.about, area_id: @venue.area_id, email: @venue.email, image: @venue.image, name: @venue.name, phone_number: @venue.phone_number, street_address: @venue.street_address, style: @venue.style, website: @venue.website } }
    end

    assert_redirected_to venue_url(Venue.last)
  end

  test "should show venue" do
    get venue_url(@venue)
    assert_response :success
  end

  test "should get edit" do
    get edit_venue_url(@venue)
    assert_response :success
  end

  test "should update venue" do
    patch venue_url(@venue), params: { venue: { about: @venue.about, area_id: @venue.area_id, email: @venue.email, image: @venue.image, name: @venue.name, phone_number: @venue.phone_number, street_address: @venue.street_address, style: @venue.style, website: @venue.website } }
    assert_redirected_to venue_url(@venue)
  end

  test "should destroy venue" do
    assert_difference('Venue.count', -1) do
      delete venue_url(@venue)
    end

    assert_redirected_to venues_url
  end
end
