require 'fileutils'
include FileUtils

def fake_working_directory
  "/tmp/mundane-virtual-working-directory"
end

def fake_out_directory
  fake_working_directory + "/out"
end


def drop_dummy_files_in_working_directory
  touch 'a'
  touch 'b'
  touch 'c'
end

def count_of_files_in(directory_path)
  Dir.glob(File.join(directory_path, '**', '*')).select { |file| File.file?(file) }.count
end

