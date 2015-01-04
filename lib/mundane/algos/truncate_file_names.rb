module Mundane
  class TruncateFileNames
    extend Mundane::FileWorker
    extend Mundane::Prompter
    
    def self.execute(desired_length)
      user_wants_to_proceed = prompt_user("Are you sure you want to make %count_targeted_files% have there file name shortened to #{desired_length}?\n[Y/n]")

      if user_wants_to_proceed
        files = get_files_in_current_folder
        
        truncate_file_names(files, desired_length)
      end
      
    end
  
    
    # This algo actually truncates the name and then tacs on the extension at the end
    def self.truncate_file_names(files, desired_length)
      require 'fileutils'
      
      files.each do |f|
        ugly_extension = File.extname(f)
        pretty_name = f.chomp(File.extname(f))
        
        file_name = f
        
        amount_to_shorten_pretty_name_by = f.length - desired_length
        
        if amount_to_shorten_pretty_name_by > 0
          resulting_file_name = pretty_name[0,pretty_name.length - amount_to_shorten_pretty_name_by ] + ugly_extension
        
          FileUtils.mv file_name, resulting_file_name
        end
        
      end
    end
   
  end
end


