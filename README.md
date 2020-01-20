# Wacky Widgets

This is a CMS for widgets. It's really not that wacky. Logged in users can create, read, update and delete widgets from the browser, and a public REST API provides all public widgets or a single public widget as json. The app is deployed at https://wackywidgets.herokuapp.com

### Setup:

This uses Ruby 2.6.3, Rails 6.0.2.1, and Postgres. Once your environment is configured including bundler, and the repo is cloned, run:
```
bundle install
rake db:create
rake db:migrate
```

To run the server on localhost:3000, run:
`rails s`

To run the tests, run:
`rspec`

Currently, users are only created from the command line. To enter the Rails console, run:
`rails c`

From the Rails console, create a user with this syntax:

`User.create(email: 'hello@example.com', password: 'Hello123!', name: 'Olleh')`

### Endpoints:

/api/v1/widgets - all the public widgets

/api/v1/widgets/:id - a single widget

### Additional Features:

To view test coverage using SimpleCov, open /coverage/index.html in the browser after running the tests. This file is automatically generated and gitignored

To view a data model visualization using ActiveDesigner, run:
`active_designer --create ./db/schema.rb`
and then open /active_designer/index.html
