#!/usr/bin/env bash
# vim: set filetype=ruby:
# chrome-bookmark - browse Chrome bookmarks with peco

open="open"
if [ "$(uname)" = 'Linux' ]; then
	open="xdg-open"
fi

/usr/bin/ruby -x "$0"                                          |
  peco --prompt "[url]" |
  awk 'BEGIN { FS = "\t" } { print $2 }'                       |
  xargs $open
exit $?

#!ruby
# encoding: utf-8

require 'json'
require 'rbconfig'

host_os = RbConfig::CONFIG['host_os']
file=""
if host_os == "linux-gnu"
	file = '~/.config/google-chrome/Default/Bookmarks'	
else
	file = '~/Library/Application Support/Google/Chrome/Default/Bookmarks'
end

CJK  = /\p{Han}|\p{Katakana}|\p{Hiragana}|\p{Hangul}/

def build parent, json
  name = [parent, json['name']].compact.join('/')
  if json['type'] == 'folder'
    json['children'].map { |child| build name, child }
  else
    { name: name, url: json['url'] }
  end
end

def just str, width
  str.ljust(width - str.scan(CJK).length)
end

def trim str, width
  len = 0
  str.each_char.each_with_index do |char, idx|
    len += char =~ CJK ? 2 : 1
    return str[0, idx] if len > width
  end
  str
end

width = `tput cols`.strip.to_i / 2
json  = JSON.load File.read File.expand_path file
items = json['roots']
        .values_at(*%w(bookmark_bar synced other))
        .compact
        .map { |e| build nil, e }
        .flatten

items.each do |item|
  name = trim item[:name], width
  puts [just(name, width),
        item[:url]].join("\t")
end
