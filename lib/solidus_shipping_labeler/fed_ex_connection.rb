require 'yaml'

module SolidusShippingLabeler
  module FedExConnection
    attr_accessor :params, :company

    def self.connection
      Fedex::Shipment.new(connection_params)
    end

    def self.config params
      raise "No 'key' passed to SolidusShippingLabeler::FedExConnection#config" if !params[:key]
      raise "No 'password' passed to SolidusShippingLabeler::FedExConnection#config" if !params[:password]
      raise "No 'meter' passed to SolidusShippingLabeler::FedExConnection#config" if !params[:meter]
      raise "No 'account_number' passed in SolidusShippingLabeler::FedExConnection#config" if !params[:account_number]
      raise "No 'mode' passed in SolidusShippingLabeler::FedExConnection#config" if !params[:mode]

      raise "Expected 'mode' setting to be either 'test' or 'production'" if !['test','production'].include?(params[:mode])

      @company = params[:company]
      @params = params
    end

    def self.connection_params
      raise "SolidusShippingLabeler::FedExConnection not configured!" if @params.nil?
      @params
    end

    def self.company
      connection_params.fetch(:company)
    end

    def self.service_name_mappings
      {
        'Fedex::PriorityOvernight'     => 'PRIORITY_OVERNIGHT',
        'Fedex::StandardOvernight'     => 'STANDARD_OVERNIGHT',
        'Fedex::TwoDay'                => 'FEDEX_2_DAY',
        'Fedex::ExpressSaver'          => 'FEDEX_EXPRESS_SAVER',
        'Fedex::Ground'                => 'FEDEX_GROUND',
        'Fedex::GroundHomeDelivery'    => 'GROUND_HOME_DELIVERY',
        'Fedex::InternationalEconomy'  => 'INTERNATIONAL_ECONOMY',

        'Usps::FirstClassMailParcels'  => 'First',
        'Usps::PriorityMail'           => 'Priority',
        'Usps::ExpressMailInternational' => 'ExpressMailInternational',
      }
    end
  end
end
