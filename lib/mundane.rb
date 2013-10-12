require 'pry'
require 'zip'

require 'mundane/version'
require 'mundane/file_worker'
require 'mundane/algos/files_to_zips'



module Mundane
  
  def self.files_to_zips
    FilesToZips.execute
  end

  def self.version
    puts Mundane::VERSION
  end

end
