# frozen_string_literal: true

class AddShippingBoxes < SolidusSupport::Migration[4.2]
  def change
    create_table "spree_shipping_boxes", force: true do |t|
      t.string   "description", null: false
      t.integer  "length",      default: 0, null: false
      t.integer  "width",       default: 0, null: false
      t.integer  "height",      default: 0, null: false
      t.datetime "created_at",                 null: false
      t.datetime "updated_at",                 null: false
    end

    add_index "spree_shipping_boxes", ["description"], name: "udx_shipping_boxes_on_description", unique: true
  end
end
