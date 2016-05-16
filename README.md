# What
This is intended to be a [Spree](https://github.com/spree/spree) extension that leverages the `fedex` gem to print RMA labels.

## Screenshot
![screenshot](http://i.imgur.com/tj7EqUP.png)

## install
* Add `gem 'solidus_shipping_labeler', github: 'solidusio-contrib/solidus_shipping_labeler'


* `bundle exec rake railties:install:migrations FROM=solidus_shipping_labeler` to generate the migrations and seed the Shipping Box data.


# Structure

* spree_shipping_boxes
| field	      | datatype  |
|-------------|-----------|
| description | string  |
| length      | integer |
| width       | integer |
| height      | integer |

(and timestamp fields)

* spree_return_labels

| field	      | datatype  |
|-------------|-----------|
| return_authorization_id      | integer  |
| spree_shipping_box_id      | integer  |
| weight      | decimal  |
| tracking_number      | string |
| width       | (integer) |
| height      | (integer) |


* The migration generator will also generate a migration that will run the seed generator (found in )