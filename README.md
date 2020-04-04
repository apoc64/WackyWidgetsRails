# Wacky Widgets

This is a CMS for widgets. It's really not that wacky. Logged in users can create, read, update and delete their own widgets from the browser, and a public REST API provides all public widgets or a single public widget as json. From the browser, logged in users can also publish all public widgets as static json to an AWS S3 bucket. The app is deployed at https://wackywidgets.herokuapp.com. Widgets in the S3 bucket can be found at https://wacky-widgets.s3.us-east-2.amazonaws.com/widgets.json.

### Setup:

This uses Ruby 2.6.3, Rails 6.0.2.2, and Postgres. If you are using homebrew and rbenv and need Ruby 2.6.3, you may need to upgrade rbenv before installing the new version of Ruby (If you are using rvm instead of rbenv, commands will be similar but different. Do not install both rbenv and rvm). If necessary, run:
```
brew upgrade rbenv
rbenv install 2.6.3
```

This uses webpacker and yarn for JavaScript dependencies. If necessary, run:
`brew install yarn`

Once your environment is configured including bundler, and the repo is cloned, run:
```
bundle install
yarn install
rake db:create
rake db:migrate
```

### Running the app:

To run the server on localhost:3000, run:
`rails s`

To run the tests, run:
`rspec`
Note: Currently, there is a deprecation warning in the test target related to autoloading constants. This does not affect the development or production environments.

Currently, users are only created from the command line. To enter the Rails console, run:
`rails c`

From the Rails console, create a user with this syntax:

`User.create(email: 'hello@example.com', password: 'Hello123!', name: 'Olleh')`

To setup AWS uploads from the locally running app, copy /config/amazon.yml.example to a new file called config/amazon.yml, which is gitignored, and add AWS credentials to the file.

### Endpoints:

The app provides a public REST API that returns json for the following endpoints:
* GET /api/v1/widgets - all the public widgets

* GET /api/v1/widgets/:id - a single widget

### Additional Features:

To view test coverage using SimpleCov, open /coverage/index.html in the browser after running the tests. This file is automatically generated and gitignored.

To view a data model visualization using ActiveDesigner, run:
`active_designer --create ./db/schema.rb`
and then open /active_designer/index.html. This file is gitignored.

To scan for security vulnerabilities using Brakeman, run:
`brakeman`
Currently, there are no errors or warnings.
