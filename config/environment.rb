require 'pry'
require 'awesome_print'

ProjectRoot ||= "#{File.dirname(__FILE__)}/.."

Dir.foreach("lib/models") do |file|
  next if file.start_with?('.')
  require_relative "../lib/models/#{file}" if file.end_with?(".rb")
end