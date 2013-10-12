module Mundane
  module Prompter
    extend Mundane::FileWorker
    
    def prompt_user(prompt)
      puts construct_informative_message(prompt)
      proceed = STDIN.gets.strip.downcase
  
      if proceed == "y" or proceed == "yes" or proceed == ""
        true 
      else
        false
      end
    end
    
    def construct_informative_message(prompt)
      prompt.sub("%count_targeted_files%", count_targeted_files.to_s)
    end
    
    extend self  # allows for unit testing...
  end
end