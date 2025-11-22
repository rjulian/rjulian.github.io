
format: 
	npx prettier --write . 

update-deps:
	bundle update

run: 
	bundle exec jekyll serve --watch
