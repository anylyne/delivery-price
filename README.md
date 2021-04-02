# 1. Getting delivery price from API endpoint
URL and token (take a look at .the_api.yml create your own file .the_api.yml)

params:  
for length use 22
for width use 16
for height use 7.7
for weight use 1.5
for from_postcode use 2000
for to_postcode use 3000
for service_code use 'AUS_PARCEL_REGULAR'

# 2. Reading CSV file and getting prices for each address
File located:
files/input-test.csv

Purpose is to get the price for each row using Address for from_address and Suburb, State and Postcode as the delivery_address

# 3. Creating CSV file outputing the delivery prices
Using the same input file and logic, create a CSV file with the delivery prices in the following format:

Postcode,Delivery Postcode,Price,Delivery Time
2040,2020,54.32,Delivered in 4 business days

# 4. Creating a CSV file for multiple vehicles and delivery options (Bonus question)
use the following service code:
AUS_PARCEL_REGULAR
AUS_PARCEL_EXPRESS

use the following package dimensions:
Bx1 - 22.0x16.0x7.7
Bx4 - 36.3x21.2x6.5
Bx8 - 43.0x30.5x14.0

Postcode,Delivery Postcode,Regular (Bx1),Regular (Bx4),Regular (Bx8),Express (Bx1),Express (Bx4),Express (Bx8)
2040,2040,20.45,20.45,20.45,27.45,27.45,27.45
