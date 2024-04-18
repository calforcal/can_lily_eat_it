# Can Lily Eat It?
<p>
  After my niece Lily developed a severe allergy to both dairy and soy, I set out to create an application for my sister to help her navigate which foods were safe for her to eat.

  Particularly when it comes to Soy, but occasionally other allergens as well - the FDA does not require refined Soy products to be listed in the "Allergens" section of food labels. This can make it difficult to discern if a product is safe to consume if you have very sensitive allergies.

  ```'Can Lily Eat It?'``` is designed so that you can search a UPC Code and get instant feedback on whether or not it is safe to eat. If it's not deemed safe, you'll get a list of the ingredients that could potentially contain allergens. Otherwise, you're good to go!
</p>

![](/app/images/app_image.png)

## Getting Started
### Prerequisites
- Ruby 3.2.2
- Rails 7.0.8
- Postgresql 14.9


### Installation
Follow these steps to install the Can Lily Eat It? App:

1. Get an API Key from [UPC Database](https://upcdatabase.org/api)
2. Fork and Clone a copy of this repo.
3. Navigate into the project directory:
```
cd can_lily_eat_it
```
4. Run the following command to bundle dependencies (Ruby Gems):
```
bundle install
```
5. Drop, Create, Migrate and Seed the Databse:
```
rails db:{drop, create, migrate, seed}
```
6. Add your UPC Database API Key to the ```config/application.yml``` file:
```
UPC_DATABASE_API_KEY: "YOUR API KEY HERE"
```
7. Run the test suite to ensure everything is working properly:
```
bundle exec rspec
```
8. Run the following command to start the local server:
```
rails s
```


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

* ...
