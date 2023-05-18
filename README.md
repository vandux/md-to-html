# Markdown to HTML

Proof of concept for static content builds via Github Actions.

Munges *.md in ./src into html within ./_site/
Includes an index.

## Local Setup

Dependencies:
```
brew install fswatch
npm install -g node-static
bundle install
```

Scripts (run from root):
Dev: `. bin/dev`
Build: `ruby bin/build.rb`
Server: `. bin/server`
