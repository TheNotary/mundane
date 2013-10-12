require 'pry'
require 'zip'

require 'mundane/version'
require 'mundane/files_to_zips'


module Mundane
  
  def self.files_to_zips
    FilesToZips.execute
    #puts "this here is a stub"
  end

  def self.version
    puts Mundane::VERSION
  end

end
