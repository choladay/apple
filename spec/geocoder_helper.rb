module GeocoderHelper
  def stub_cupertino_geocode
    Geocoder.configure(lookup: :test)
    Geocoder::Lookup::Test.add_stub(
      "Cupertino, CA", [ {
                              "latitude": 37.3228934,
                              "longitude": -122.0322895,
                              "address": 'Cupertino, CA, USA',
                              "postcode": "95014",
                              "state": 'California',
                              "state_code": 'CA',
                              "country": 'United States',
                              "country_code": 'US'
                          } ]
    )
  end
end
