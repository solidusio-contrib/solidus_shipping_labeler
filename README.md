# What
This is intended to be a [Spree](https://github.com/spree/spree) extension that leverages the `fedex` gem to print RMA labels.

## Screenshot
![screenshot](http://i.imgur.com/tj7EqUP.png)

## install
* Add 
```
gem 'solidus_shipping_labeler', github: 'solidusio-contrib/solidus_shipping_labeler'
```


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
| width       | integer |
| height      | integer |

(and timestamp fields)

* The migration generator will also generate a migration that will run the seed generator (found in ```db/seeds.rb```)

# Configuration
Make sure your stock location has complete address and phone number details. (FedEx requires a phone number to generate a label and will complain if one is not present.)


# Operator Use

1. On a completed and shipped order, create a new RA (Return Authorization)
2. After you create the RA, you will land back on the screen showing the list of RAs associated with that order
3. Edit your RA, at the bottom of the screen you will see a drop-down to choose the box size and a button "Generate New Label"


