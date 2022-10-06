# README


View the app on Heroku here:

https://whispering-reaches-58521.herokuapp.com/


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

   geocoder - Used for getting coordinates based on an address

   httparty - Used to interact with the Weather.gov API to pull the weather.


Discussion:

This app is absolutely thrown together. It has bugs! It collects addresses from searches, and attempts to show the weather for that address, or fail somewhat gracefully. 

The weather is pulled from Weather.gov

The coordinates for the calls come from the Geocoder gem.

The intention is to keep the queries for weather in the DB for two reasons:
1) For analytics purposes later. To see what locations people are searching for.
2) So that the security features built into Rails like CSRF protection are active.

Objectives:

Coding Assignment

Requirements:
Must be done in Ruby on Rails
Accept an address as input
Retrieve forecast data for the given address. This should include, at minimum, the current temperature (Bonus points - Retrieve high/low and/or extended forecast)
Display the requested forecast details to the user
Cache the forecast details for 30 minutes for all subsequent requests by zip codes. Display indicator if result is pulled from cache.

Assumptions:
This project is open to interpretation
Functionality is a priority over form
If you get stuck, complete as much as you can

Submission:
Use a public source code repository (GitHub, etc) to store your code
Send us the link to your completed code

