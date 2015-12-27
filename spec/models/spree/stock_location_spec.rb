require 'spec_helper'

describe Spree::StockLocation do
  let(:klass) { Spree::StockLocation }

  describe "public instance methods" do
    it "should have a :company method returning a string" do
      subject.should respond_to(:company)
      subject.company.is_a?(String).should be_true
    end

    it "should have a :fedex_formatted method that returns a hash" do
      subject.should respond_to(:fedex_formatted)
      subject.fedex_formatted.is_a?(Hash).should be_true
    end
  end
end
