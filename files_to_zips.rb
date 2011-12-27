# files to zips
# A ruby script for reading all files in a directory and quickly converting them to zip files and plopping them in a folder named "out" Great for emulators that require zipped files (NestopiaX 1.3) 
#
# This is a script that converts all files in a folder into zip files of the same name, and puts these zips in ./out/

require 'zip/zip'   # gem install rubyzip


def compress_files_and_write_to_out_as_zips(files)
	files.each do
		|f|
		pretty_name = f.chomp(File.extname(f))
		if File.exists?("out\\#{pretty_name}.zip)
      puts "out\\#{pretty_name}.zip  ALREADY EXISTED, SKIPPING FILE.  DELETE MANUALLY IF PREFERED =/"
      next
		end
		Zip::ZipFile.open("out\\#{pretty_name}.zip", Zip::ZipFile::CREATE) {
			|zipfile|
			zipfile.add(f, f)
		}
	end
end

def file_name_less_extension(full_name)
	full_name = full
end

def get_files_in_current_folder
	files = []
	Dir.foreach(".") do
		|f|
		next if File.directory?(f) or f == __FILE__       # skip directory names and the script we're running...
		files << f
	end
	return files
end

def make_output_directory
	Dir.mkdir("out") unless Dir.exists?("out")
end

def ask_user_if_theyd_like_to_make_zips
	puts "Are you sure you want to make X zip files and put them into ./out/ ?"
	puts "[Y/n]"
	puts
	proceed = STDIN.gets.strip.downcase
	
	if proceed == "y" or proceed == "yes" or proceed == ""
		proceed = true 
	else
		proceed = false
	end
	return proceed
end



# Begin Script ##################################################################################
#

proceed = ask_user_if_theyd_like_to_make_zips

if proceed
	make_output_directory
	
	files = get_files_in_current_folder
	
	compress_files_and_write_to_out_as_zips(files)
end
