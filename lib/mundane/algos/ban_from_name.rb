module Mundane
  class BanFromName
    extend Mundane::FileWorker
    extend Mundane::Prompter
    
    def self.execute(banned_characters)
      user_wants_to_proceed = prompt_user("Are you sure you want to make %count_targeted_files% have offensive characters stripped from their names?\n[Y/n]")

      if user_wants_to_proceed
        files = get_files_in_current_folder
        
        ban_from_name(files, banned_characters)
      end
      
    end
  
    
    # This algo actually truncates the name and then tacs on the extension at the end
    def self.ban_from_name(files, banned_characters)
      require 'fileutils'
      
      banned_characters = banned_characters.split ""
      
      files.each do |f|
        ugly_extension = File.extname(f)
        pretty_name = f.chomp(File.extname(f))
        
        resulting_file_name = f.dup
        banned_characters.each do |char|
          resulting_file_name.gsub!(char, "")
        end
        
        FileUtils.mv f, resulting_file_name if resulting_file_name != f
          
      end
    end
   
  end
end


