module Mundane
  class FilesToZips
    
    def self.execute
      user_wants_to_proceed = ask_user_if_theyd_like_to_make_zips

      if user_wants_to_proceed
        make_output_directory
  
        files = get_files_in_current_folder
  
        compress_files_and_write_to_out_as_zips(files)
      end
      
    end
  
    def self.compress_files_and_write_to_out_as_zips(files)
      files.each do
        |f|
        pretty_name = f.chomp(File.extname(f))
        if File.exists?("out/#{pretty_name}.zip")
          puts "out/#{pretty_name}.zip  ALREADY EXISTED, SKIPPING FILE.  DELETE MANUALLY IF PREFERED =/"
          next
        end
        Zip::File.open("out/#{pretty_name}.zip", Zip::File::CREATE) {
          |zipfile|
          zipfile.add(f, f)
        }
      end
    end

    def self.get_files_in_current_folder
      files = []
      Dir.foreach(".") do
        |f|
        next if File.directory?(f) or f == __FILE__       # skip directory names and the script we're running...
        files << f
      end
      return files
    end

    def self.make_output_directory
      Dir.mkdir("out") unless Dir.exists?("out")
    end

    def self.ask_user_if_theyd_like_to_make_zips
      puts "Are you sure you want to make X zip files and put them into ./out/ ?"
      puts "[Y/n]"
      proceed = STDIN.gets.strip.downcase
  
      if proceed == "y" or proceed == "yes" or proceed == ""
        proceed = true 
      else
        proceed = false
      end
      return proceed
    end
    
    
    
  end
end


