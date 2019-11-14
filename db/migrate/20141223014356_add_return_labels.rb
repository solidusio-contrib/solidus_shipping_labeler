# frozen_string_literal: true

class AddReturnLabels < SolidusSupport::Migration[4.2]
  def change
    create_table "spree_return_labels", force: true do |t|
      t.belongs_to :return_authorization
      t.belongs_to :spree_shipping_box
      t.decimal  "weight", precision: 8, scale: 2
      t.datetime "created_at",                                       null: false
      t.datetime "updated_at",                                       null: false
      t.text     "pdf_text"
      t.string   "tracking_number"
    end

    add_index :spree_return_labels, [:return_authorization_id], name: :idx_spree_shipping_labels_on_return_authorization
  end
end
