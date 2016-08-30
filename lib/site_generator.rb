class SiteGenerator
  attr_reader :path

  def initialize(path)
    @path = path
    FileUtils.mkdir_p path
    FileUtils.mkdir_p "#{path}/artists"
  end

  def generate_index
    # First load the template string
    template_string = File.read("./lib/views/index.html.erb")
    # Instantiate the ERB template instance
    template = ERB.new(template_string)
    html = template.result

    File.write("#{path}/index.html", html)
  end

  def generate_artist_index
    # First load the template string
    template_string = File.read("./lib/views/artists/index.html.erb")
    # Instantiate the ERB template instance
    template = ERB.new(template_string)
    html = template.result

    File.write("#{path}//artists/index.html", html)
  end

  def call
    generate_index
    generate_artist_index
  end

end