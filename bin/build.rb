#!/usr/bin/env ruby

# require 'byebug'
require 'kramdown'
require 'fileutils'

# delete everything in dist directory
FileUtils.rm_rf('_site')

pages = []

def page_list(pages)
  pages.map do |page|
    "<li><a href=\"#{page}\">#{page}</a></li>"
  end.join("")
end

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
  pages << file_path
  FileUtils.mkdir_p("_site/#{File.dirname(file_path)}")
  File.open("_site/#{file_path}", "w") { |f| f.write(html) }
end

# print index
index = "<ul>#{page_list(pages)}</ul>"

File.open("_site/index.html", "w") { |f| f.write(index) }
