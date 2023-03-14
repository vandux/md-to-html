#!/usr/bin/env ruby

require 'byebug'
require 'kramdown'
require 'fileutils'

# delete everything in dist directory
FileUtils.rm_rf('dist')

# traverse src directory for markdown files
for file in Dir.glob('src/**/*.md')
  # read file
  file_contents = File.read(file)
  # parse front matter
  # front_matter = file_contents&.match(/---(.*)---/m)[1]
  # parse markdown
  # markdown = file_contents.match(/---(.*)---/m)[2]
  markdown = file_contents
  # render html from markdown
  html = Kramdown::Document.new(markdown).to_html
  # write html to dist directory with same path and filename as src
  file_path = file.gsub('src/', '').gsub('.md', '.html')
  FileUtils.mkdir_p("dist/#{File.dirname(file_path)}")
  File.open("dist/#{file_path}", "w") { |f| f.write(html) }
end
