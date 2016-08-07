require 'test_helper'

class CampingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camping = campings(:one)
  end

  test "should get index" do
    get campings_url
    assert_response :success
  end

  test "should get new" do
    get new_camping_url
    assert_response :success
  end

  test "should create camping" do
    assert_difference('Camping.count') do
      post campings_url, params: { camping: { adresse: @camping.adresse, code_postale: @camping.code_postale, commune: @camping.commune, courriel: @camping.courriel, departement_id: @camping.departement_id, description: @camping.description, etoile: @camping.etoile, latitude: @camping.latitude, longitude: @camping.longitude, name: @camping.name, nomdep: @camping.nomdep, nomregion: @camping.nomregion, numdep: @camping.numdep, region_id: @camping.region_id, site_internet: @camping.site_internet, slug: @camping.slug, tel: @camping.tel, user_id: @camping.user_id, ville_id: @camping.ville_id } }
    end

    assert_redirected_to camping_url(Camping.last)
  end

  test "should show camping" do
    get camping_url(@camping)
    assert_response :success
  end

  test "should get edit" do
    get edit_camping_url(@camping)
    assert_response :success
  end

  test "should update camping" do
    patch camping_url(@camping), params: { camping: { adresse: @camping.adresse, code_postale: @camping.code_postale, commune: @camping.commune, courriel: @camping.courriel, departement_id: @camping.departement_id, description: @camping.description, etoile: @camping.etoile, latitude: @camping.latitude, longitude: @camping.longitude, name: @camping.name, nomdep: @camping.nomdep, nomregion: @camping.nomregion, numdep: @camping.numdep, region_id: @camping.region_id, site_internet: @camping.site_internet, slug: @camping.slug, tel: @camping.tel, user_id: @camping.user_id, ville_id: @camping.ville_id } }
    assert_redirected_to camping_url(@camping)
  end

  test "should destroy camping" do
    assert_difference('Camping.count', -1) do
      delete camping_url(@camping)
    end

    assert_redirected_to campings_url
  end
end
