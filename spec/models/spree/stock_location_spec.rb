require 'spec_helper'

describe Spree::StockLocation do
  describe "public instance methods" do
    it "should have a :company method returning a string" do
      expect(subject).to respond_to(:company)
      expect(subject.company).to be_a(String)
    end

    it "should have a :fedex_formatted method that returns a hash" do
      allow(SolidusShippingLabeler::FedExConnection).to receive(:company)
        .and_return('ACME')

      expect(subject).to respond_to(:fedex_formatted)
      expect(subject.fedex_formatted).to be_a(Hash)
    end
  end
end
