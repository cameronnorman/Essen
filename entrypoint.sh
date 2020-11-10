bundle exec rails db:setup
bundle exec rails db:migrate
bundle exec rails server --binding 0.0.0.0 -p 3000
