require 'rails_helper'

RSpec.describe "weather_report/index", type: :view do
  it "displays the address search text field" do
    render

    expect(rendered).to match /Search For Weather Report/
  end

  describe "weather results" do
    it "does not display results if there is no address given" do
      render

      expect(rendered).to_not match /Weather Report for/
    end

    it "displays results if there is an address given" do
      address = "Cupertino, CA"
      allow(view).to receive(:params).and_return({ address: address })

      render

      expect(rendered).to match /Weather Report for #{address}/
    end
  end
end
