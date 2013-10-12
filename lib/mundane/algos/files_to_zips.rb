module Mundane
  class FilesToZips
    extend Mundane::FileWorker
    extend Mundane::Prompter
    
    def self.execute
      user_wants_to_proceed = prompt_user("Are you sure you want to make %count_targeted_files% zipped files and put them into ./out/ ?\n[Y/n]")

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
   
  end
end


