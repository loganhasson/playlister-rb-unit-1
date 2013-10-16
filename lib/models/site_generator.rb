# the instructions seem to indicate we don't use
# any require or require_relative statements here
require_relative '../../config/environment'

class SiteGenerator

  OBJECTS = ["artists", "genres", "songs"]

  def self.generate_index_page(object)
    # which dir does File.open start looking from? I thought it would be the bin folder,
    # but line 13 seems to indicate it's the project root.
    object_index = ERB.new(File.open("#{ProjectRoot}/lib/views/#{object}/#{object}.erb").read)
    File.open("_site/#{object}.html", "w+") do |f|
      f << object_index.result # why was binding needed on line 29 but not here?
    end
  end

  def self.generate_all_index_pages
    OBJECTS[0..1].each do |object|
      generate_index_page(object)
    end
  end

  def self.generate_show_page(object)
    show_index = ERB.new(File.open("#{ProjectRoot}/lib/views/#{object}/#{object[0...-1]}_show.erb").read)

    eval("#{object.capitalize[0...-1]}").all.each do |o|
      File.open("_site/#{object}/#{o.name.gsub(' ', '_')}.html", "w+") do |f|
        f << show_index.result(binding)
      end
    end
  end

  def self.generate_all_show_pages
    OBJECTS.each do |object|
      generate_show_page(object)
    end
  end
  # genre pages
  # song pages

  def self.run
    generate_all_index_pages
    generate_all_show_pages
  end

end