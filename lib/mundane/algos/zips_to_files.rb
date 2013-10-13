module Mundane
  class ZipsToFiles
    extend Mundane::FileWorker
    extend Mundane::Prompter
    
    def self.execute
      user_wants_to_proceed = prompt_user("Are you sure you want to unzip %count_targeted_files% zip files and dump their contents into ./out/ ?\n[Y/n]")

      if user_wants_to_proceed
        make_output_directory
        files = get_files_in_current_folder
        decompress_files_and_dump_them_to_out(files)
      end
      
    end
    
    def self.decompress_files_and_dump_them_to_out(files)
      incomplete_extractions = 0
      all_files_were_archives = true
      
      # decompress each file in the list
      files.each do |zip|
                                             # TODO:  next if zip.extension != 'zip'
        begin
          Zip::File.open(zip) do |archive|
            archive.each do |f|
              output_path = "out/#{f.name}"
              if File.exists? output_path          # don't auto-overwrite anything...
                puts "#{output_path} ALREADY EXISTED, SKIPPING FILE."
                incomplete_extractions += 1
                next
              end
              
              FileUtils.mkdir_p File.dirname(output_path)
              f.extract output_path
            end
          end
        rescue
          # skip the file if it can't be opened like a zip
          all_files_were_archives = false
        end

      end
      
      puts "\nOperation terminated, there were #{incomplete_extractions} incomplete extractions." if incomplete_extractions > 0
      puts "Not all files were valid archives" unless all_files_were_archives
    end
    
  end
end