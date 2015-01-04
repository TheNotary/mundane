require 'zip'

require 'mundane/version'
require 'mundane/file_worker'
require 'mundane/prompter'
require 'mundane/algos/files_to_zips'
require 'mundane/algos/zips_to_files'
require 'mundane/algos/truncate_file_names'



module Mundane
  
  def self.files_to_zips
    FilesToZips.execute
  end
  
  def self.zips_to_files
    ZipsToFiles.execute
  end
  
  def self.truncate_file_names(desired_length)
    TruncateFileNames.execute(desired_length.to_i)
  end

  def self.version
    Mundane::VERSION
  end

end
