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
4.
