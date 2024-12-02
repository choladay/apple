module GeocoderHelper
  def stub_cupertino_geocode
    expect(Geocoder).to receive(:search).with("Cupertino, CA").and_return(
      [ double(data: JSON.parse(file_fixture("geoapify/cupertino.json").read)) ]
    )
  end
end
