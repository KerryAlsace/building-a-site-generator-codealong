1. Initial Setup (in command line:)
  rspec --format-documentation
  or
  rspec --format=html > spec.html
  open spec.html
2. Add to Artist class
    attr_writer :songs

    def songs
      @songs.dup.freeze
    end
3. Remove from Artist class 
    attr_accessor :songs
              ###### This Didn't work but cool to know
              A. Add before Artist class
                  class ModifyAssociationError < StandardError
                  end
              B. Revise previous #songs method in Artist class
                  def songs
                    begin
                      @songs.dup.freeze
                    rescue RuntimeError
                      raise ModifyAssociationError,  "Use the #add_song method to add a song to an artist's collection"
                    end
                  end
4. I want to be able to say rake generate_site
5. When I run rake generate_site, I want to generate a static HTML site in a directory called _site
6. In that site I should have:
  a. an index.html file that has links to all the Artists, Genres, and Songs
  b. artists/index.html that has a list of all artists with linkts to individual artists show page
  c. artists/fun.html should list all of the songs for an artist, and link to the song show page
  d. songs/index.html
  e. songs/show.html shows the song name

