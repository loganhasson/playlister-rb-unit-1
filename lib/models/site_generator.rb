require_relative '../../config/environment'

class SiteGenerator

  # generate and index page that shows all artists
  def self.generate_index_pages

  end
  # an index page that shows all genres
  # artist pages
  # genre pages
  # song pages

end

artists_index = ERB.new(File.open('lib/templates/artists.erb').read)
@artists = Artist.all

File.open('_site/artists/index.html', 'w+') do |f|
  f << artists_index.result
end