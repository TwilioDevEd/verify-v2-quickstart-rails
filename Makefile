 
.PHONY: install database serve

install:
	bundle install; \
	npm install;

database:
	bundle exec rails db:migrate

serve:
	bundle exec rails server --binding 0.0.0.0
