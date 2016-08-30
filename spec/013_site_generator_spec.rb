describe SiteGenerator do

  describe '#initialize' do
    it 'takes a path to generate the site in' do
      site_generator = SiteGenerator.new("_site")

      expect(site_generator.path).to eq("_site")
    end
  end

  describe '#generate_index' do
    it 'makes an index.html file within the path' do
      site_generator = SiteGenerator.new("_site")

      site_generator.generate_index

      # expect{File.exists?("#{site_generator.path}/index.html")}.to be_truthy
      expect(File).to exist("#{site_generator.path}/index.html")
    end
  end
  
end

  # describe '' do
  #   it '' do
  #   end
  # end