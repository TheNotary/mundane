module Mundane
  class FilesToZips
    extend Mundane::FileWorker
    
    def self.execute
      user_wants_to_proceed = prompt_user_if_theyd_like_to_make_zips

      if user_wants_to_proceed
        make_output_directory
        files = get_files_in_current_folder
        compress_files_and_write_to_out_as_zips(files)
      end
      
    end
  
    def self.compress_files_and_write_to_out_as_zips(files)
      files.each do |f|
        pretty_name = f.chomp(File.extname(f))
        
        if File.exists?("out/#{pretty_name}.zip")
          puts "out/#{pretty_name}.zip  ALREADY EXISTED, SKIPPING FILE.  DELETE MANUALLY IF NEEDED =/"
          next
        end
        
        Zip::File.open("out/#{pretty_name}.zip", Zip::File::CREATE) do |zipfile|
          zipfile.add(f, f)
        end
        
      end
    end



    def self.prompt_user_if_theyd_like_to_make_zips
      puts "Are you sure you want to make X zip files and put them into ./out/ ?\n[Y/n]"
      proceed = STDIN.gets.strip.downcase
  
      if proceed == "y" or proceed == "yes" or proceed == ""
        true 
      else
        false
      end
    end
    
    
    
  end
end


