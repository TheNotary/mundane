require 'zip'

require 'mundane/version'
require 'mundane/file_worker'
require 'mundane/prompter'
require 'mundane/algos/files_to_zips'
require 'mundane/algos/zips_to_files'



module Mundane
  
  def self.files_to_zips
    FilesToZips.execute
  end
  
  def self.zips_to_files
    ZipsToFiles.execute
  end

  def self.version
    Mundane::VERSION
  end

end
