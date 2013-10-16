require 'pry'
require 'awesome_print'
require 'erb'

ProjectRoot ||= "#{File.dirname(__FILE__)}/.."

# why aren't we passing ("../lib/concerns") here?
Dir.foreach("lib/concerns") do |file|
  next if file.start_with?('.')
  require_relative "../lib/concerns/#{file}" if file.end_with?(".rb")
end

# samy question as line 7
Dir.foreach("lib/models") do |file|
  next if file.start_with?('.')
  require_relative "../lib/models/#{file}" if file.end_with?(".rb")
end