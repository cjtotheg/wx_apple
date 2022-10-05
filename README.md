# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

`
cj@admins-Mini-2 wx_apple % bin/rails generate scaffold wx street:string city:string state_or_province:string postal_code:string country:string
      invoke  active_record
      create    db/migrate/20221005140730_create_wxes.rb
      create    app/models/wx.rb
      invoke    test_unit
      create      test/models/wx_test.rb
      create      test/fixtures/wxes.yml
      invoke  resource_route
       route    resources :wxes
      invoke  scaffold_controller
      create    app/controllers/wxes_controller.rb
      invoke    erb
      create      app/views/wxes
      create      app/views/wxes/index.html.erb
      create      app/views/wxes/edit.html.erb
      create      app/views/wxes/show.html.erb
      create      app/views/wxes/new.html.erb
      create      app/views/wxes/_form.html.erb
      create      app/views/wxes/_wx.html.erb
      invoke    resource_route
      invoke    test_unit
      create      test/controllers/wxes_controller_test.rb
      create      test/system/wxes_test.rb
      invoke    helper
      create      app/helpers/wxes_helper.rb
      invoke      test_unit
      invoke    jbuilder
      create      app/views/wxes/index.json.jbuilder
      create      app/views/wxes/show.json.jbuilder
      create      app/views/wxes/_wx.json.jbuilder
`


gem "geocoder", "~>1.8.1"
gem 'httparty', '~> 0.18.1'
