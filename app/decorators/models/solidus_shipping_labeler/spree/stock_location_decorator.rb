# frozen_string_literal: true

module SolidusShippingLabeler::Spree::StockLocationDecorator
  module ClassMethods
    # Shipping destination for returns
    def return_processing
      first
    end
  end

  def self.prepended(base)
    base.singleton_class.prepend ClassMethods
  end

  def company
    "Working Title"
  end

  def fedex_formatted
    {
      company: SolidusShippingLabeler::FedExConnection.company,
      phone_number: phone,
      address: [address1, address2].compact.join(' '),
      city: city,
      state: state&.abbr,
      postal_code: zipcode,
      country_code: country&.iso,
      residential: company.present?,
    }
  end

  Spree::StockLocation.prepend self
end
