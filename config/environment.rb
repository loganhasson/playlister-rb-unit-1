Dir.foreach("lib/models") do |file|
  next if file.start_with?('.')
  require_relative "#{file}" if file.end_with?(".rb")
end