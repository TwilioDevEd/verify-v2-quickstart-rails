install:
	bundle install

database:
	bundle exec rails db:migrate

serve:
	bundle exec rails server
