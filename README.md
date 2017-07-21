# National Park API

#### This is a API Application built using Ruby on Rails.  July 16, 2017

#### By Jennifer Kinsey

## Description

This is an API that includes (fake) data for National Parks.  It includes multiple scopes listed below for querying.


Scopes:
-Filters park by parameters: name, state, mailing address, phone, description, date open through, closures, amenities, activities.
-find random parks (input number of random returns requested)
-find all parks with at least x number of square miles
-find all parks with a maximum entry fee of x


## Database Seeding

The application is seeded using `faker`.  It seeds 250 parks.

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](https://git-scm.com/)
* [Postgres](https://www.postgresql.org/)
* [Ruby](https://www.ruby-lang.org/en/downloads/)
* [Rails](http://rubyonrails.org/)

## Installation

In your terminal:
* `git clone https://github.com/jennifer-kinsey/travel-api`
* `cd travel_api`
* `bundle install`
* Open another terminal window and type `postgres`.  Leave this window open.
* In your first terminal window type:
* `bundle exec rake db:setup`
* `bundle exec rake db:test:prepare`


You can test the API in Postman.

* URL: localhost:3000/


## Development server

Run `bundle exec rails s` for a dev server. Navigate to `http://localhost:3000/`. The app will automatically reload if you change any of the source files.

* If you would like to make changes to this project, do so in a text editor.
* Make frequent commits with detailed comments.
* Submit changes a pull request.

## Running tests

This app uses RSpec and Shouldamatchers for testing.
Run `rspec` in terminal to test.


## Performing Searches

See table below for possible searches and an example of performing in Postman/CURL.

#### Park Searches

| Parameter | Sample Value | Description |
|-----------|:------------:|------------:|
| name_scope |  Grand Canyon | The park's name; searches for similar match without case sensitivity. |
| state_scope |    Oklahoma   |  The state of a park; returns all parks of similar state name, regardless of case input.  |
| mailingaddress_scope | Portland |    Returns all parks that match partial address inputs, such as city in address. |
| phone_scope | USA |    Returns parks of the phone provided. |
| description_scope | awesome views | returns all parks matching the words provided in the description |
| max_fee_scope |    20   |  The max fee allowable of a park; returns all parks of less than or equal value for fee  |
| open_through_scope* |    November   |  The date the park will close; returns all parks closing in November, in this case.  |
| closure_scope* |    Main Trail   |  Any trail or road closures in the park; returns all parks with closure on the inputted value.  |
| amenities_scope |    restroom   |  The amenities available at the park; returns all parks having restrooms in this example.  |
| activities_scope |    horseback riding   |  The activities listed of a park; returns all parks having horseback riding.  |
| min_sq_mi_scope |    500   |  The area of a park; returns all parks with at least 500 sq feet.  |
| random | 5 | Depending on integer input, will return a number of random parks; in this case, will return 5 random parks |



## Technologies Used

* Ruby
* Rails
* ActiveRecord
* Postgres
* Bundler
* Rake Gem
* HTML
* CSS
* Bootstrap
* ES6
* SimpleCov
* FactoryGirl

## License

MIT License

Copyright (c) 2017 Jennifer Kinsey

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
