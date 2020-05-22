# frozen_string_literal: true

require 'spec_helper'

describe "Admin order RMA label creation", js: true do
  let(:current_user) { FactoryBot.create(:admin_user, :with_api_key) }

  let(:order) { FactoryBot.create(:shipped_order) }
  let(:rma) { FactoryBot.create(:return_authorization) }

  before do
    allow_any_instance_of(Spree::Admin::BaseController).to receive(:try_spree_current_user)
      .and_return(current_user)

    allow(Utilities::FedExLabeler).to receive(:new)
      .and_return(instance_double('Utilities::FedExLabeler', generate: {
                                    label: 'test',
                                    tracking_number: 'FEDEX123456',
                                  }))
  end

  it 'creating a return label' do
    Spree::Shipping::Box.create!(description: 'test')

    visit spree.edit_admin_order_return_authorization_path(rma.order, rma)
    click_button I18n.t('spree.generate_new_label')

    expect(Spree::ReturnLabel.count).to eq(1)
  end
end
