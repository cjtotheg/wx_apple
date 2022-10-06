# README

* Ruby version

3.1.2p20

* Database creation

Postgresql

* How to run the test suite

rspec -f d

* Services (job queues, cache servers, search engines, etc.)

caching weather for 30 minutes, or pulling again

* Deployment instructions

put it on Heroku

* Gems needed:

gem "geocoder", "~>1.8.1"
gem 'httparty', '~> 0.18.1'


Discussion:

This app is absolutely thrown together. It has bugs! It collects addresses from searches, and attempts to show the weather for that address, or fail somewhat gracefully. 

The weather is pulled from Weather.gov

The coordinates for the calls come from the Geocoder gem.

The intention is to keep the queries for weather in the DB for two reasons:
1) For analytics purposes later. To see what locations people are searching for.
2) So that the security features built into Rails like CSRF protection are active.


