# frozen_string_literal: true

module SolidusShippingLabeler::Spree::AddressDecorator
  def fedex_formatted
    {
      name: full_name,
      company: company,
      phone_number: phone,
      address: [address1, address2].compact.join(' '),
      city: city,
      state: state&.abbr,
      postal_code: zipcode,
      country_code: country&.iso,
      residential: false, # going commercial to get access to FedEx Ground
    }
  end

  Spree::Address.prepend self
end
