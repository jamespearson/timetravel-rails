# README

## Dependencies
This app using Rails 5.2.3 and ruby 2.6.2

# Setup
1. Rename config/application.sample.yml to application.yml
2. You need to get a citymapper_key and put in config/application.yml
3. At the root of the project run:
    ```
        bundle install
        bundle exec rails db:setup
        bundle exec rails db:migrate
        bundle exec rails s
    ```
4. The app should now be running on http://localhost:3000

## App specifications
This app was built to satify [this brief](https://github.com/jamespearson/timetravel-rails/blob/master/BRIEF.md) using Ruby on Rails. While the brief was open, I attempted to timebox the development in to a window of under 4 hours.

Because of this, there is plenty of "future development" that could be done, including:
* Error messages when a save / update fails
* Only using Rails for an API, and creating the front end in React.
* Better design
