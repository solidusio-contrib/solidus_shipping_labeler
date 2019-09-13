require 'spec_helper'

feature "Admin order RMA label creation", js: true do

  stub_authorization!

  let(:order) { FactoryBot.create(:shipped_order) }
  let(:rma) { FactoryBot.create(:return_authorization) }

  scenario 'creating gift card' do
    visit spree.edit_admin_order_return_authorization_path(rma.order, rma)
    click_on 'return-label-button'
  end
    #Spree::GiftCard.count.should eql(0)
    #click_link 'New Gift Card'
    #fill_in 'gift_card[email]', with: 'spree@example.com'
    #fill_in 'gift_card[name]', with: 'First Last'
    #fill_in 'gift_card[note]', with: 'Test message.'
    #select2 '$50.00', from: 'Value'
    #click_button 'Create'
    #page.should have_content('You have successfully created the gift card.')
    #within 'table.index' do
      #page.should have_content('First Last')
      #Spree::GiftCard.count.should eql(1)
    #end
  #end

  #scenario 'creating gift card with invalid data renders new form with errors' do
    #visit spree.admin_gift_cards_path
    #Spree::GiftCard.count.should eql(0)
    #click_link 'New Gift Card'
    #fill_in 'gift_card[email]', with: 'example.com'
    #fill_in 'gift_card[name]', with: 'First Last'
    #fill_in 'gift_card[note]', with: 'Test message.'
    #select2 '$50.00', from: 'Value'
    #click_button 'Create'
    #page.should have_css('.field_with_errors #gift_card_email')
    #Spree::GiftCard.count.should eql(0)
  #end

  #scenario 'deleting gift card' do
    #create :gift_card, name: 'First Last'
    #visit spree.admin_gift_cards_path
    #within 'table.index' do
      #page.should have_content('First Last')
      #click_link 'Delete'
      #page.driver.browser.switch_to.alert.accept
    #end
    #sleep 1
    #Spree::GiftCard.count.should eql(0)
  #end

  #scenario 'updating gift card' do
    #create :gift_card, name: 'Testing'
    #visit spree.admin_gift_cards_path
    #click_link 'Edit'
    #fill_in 'gift_card[email]', with: 'spree@example.com'
    #fill_in 'gift_card[name]', with: 'First Last'
    #fill_in 'gift_card[note]', with: 'Test message.'
    #click_button 'Update'
    #page.should have_content("Gift card \"First Last\" has been successfully updated!")
    #within 'table.index' do
      #page.should have_content('First Last')
    #end
  #end

end
