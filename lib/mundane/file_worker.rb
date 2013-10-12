module Mundane
  module FileWorker
    
    def make_output_directory
      Dir.mkdir("out") unless Dir.exists?("out")
    end
    
    def get_files_in_current_folder
      files = []
      Dir.foreach(".") do |f|
        next if File.directory?(f) # or f == __FILE__       # skip directory names and the script we're running...
        files << f
      end
      return files
    end
    
  end
end