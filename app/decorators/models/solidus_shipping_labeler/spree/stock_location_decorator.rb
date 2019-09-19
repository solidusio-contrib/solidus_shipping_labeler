Spree::StockLocation.class_eval do
  def company
    "Working Title"
  end

  def fedex_formatted
    {
      company:       SolidusShippingLabeler::FedExConnection.company,
      phone_number:  phone,
      address:       [address1, address2].compact.join(' '),
      city:          city,
      state:         state && state.abbr,
      postal_code:   zipcode,
      country_code:  country && country.iso,
      residential:   !company.blank?,
    }
  end

  # Shipping destination for returns
  def self.return_processing
    first
  end
end
