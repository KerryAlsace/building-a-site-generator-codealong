class SiteGenerator
  attr_reader :path

  def initialize(path)
    @path = path
    FileUtils.mkdir_p path
    FileUtils.mkdir_p "#{path}/artists"
    FileUtils.mkdir_p "#{path}/genres"
    FileUtils.mkdir_p "#{path}/songs"
  end

  def generate_index(template_path)
    # First load the template string
    template_string = File.read("./lib/views/#{template_path}.erb")
    # Instantiate the ERB template instance
    template = ERB.new(template_string)
    html = template.result

    File.write("#{path}/#{template_path}", html)
  end

  def generate_artist_show
    binding.pry
    template_string = File.read("./lib/views/artists/show.html.erb")
    template = ERB.new(template_string)

    Artist.all.each do |artist|
      html = template.result(binding)
      File.write("#{path}/artists/#{artist.name}.html", html)
    end
  end

  def generate_genre_show
    template_string = File.read("./lib/views/genres/show.html.erb")
    template = ERB.new(template_string)

    Genre.all.each do |genre|
      html = template.result(binding)
      File.write("#{path}/genres/#{genre.name}.html", html)
    end
  end

  def generate_song_show
    template_string = File.read("./lib/views/songs/show.html.erb")
    template = ERB.new(template_string)

    Song.all.each do |song|
      html = template.result(binding)
      File.write("#{path}/songs/#{song.name}.html", html)
    end
  end

  def call
    generate_index("index.html")
    generate_index("artists/index.html")
    generate_index("genres/index.html")
    generate_index("songs/index.html")
    generate_artist_show
    generate_genre_show
    generate_song_show
  end

end