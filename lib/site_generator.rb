class SiteGenerator
  attr_reader :path

  def initialize(path)
    @path = path
    FileUtils.mkdir_p path
  end

  def generate_index
    # HEREDOC
    html = <<-HTML
      <h1>Welcome to the Ruby Music Site</h1>
      <ul>
        <li><a href="artists/index.html">Artists</a></li>
        <li><a href="genres/index.html">Genres</a></li>
        <li><a href="songs/index.html">Songs</a></li>
      </ul>
    HTML
    File.write("#{path}/index.html", html)
  end

end