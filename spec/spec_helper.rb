require 'fileutils'
include FileUtils

def fake_working_directory
  "/tmp/mundane-virtual-working-directory"
end

def fake_out_directory
  fake_working_directory + "/out"
end

def clean_dummy_working_directory
  rm_rf(Dir.glob("/tmp/mundane-virtual-working-directory/*"))
end

def drop_dummy_files_in_working_directory
  touch "/tmp/mundane-virtual-working-directory/a"
  touch "/tmp/mundane-virtual-working-directory/b"
  touch "/tmp/mundane-virtual-working-directory/c"
end

def drop_dummy_zip_file
  # This string was coppied from a hex editor (blessy) on linux
  byte_array_of_zip_file = "50 4B 03 04 0A 03 00 00 00 00 9A 85 4C 43 05 40 6D 5B 08 00 00 00 08 00 00 00 01 00 00 00 61 68 65 6C 6C 6F 20 61 0A 50 4B 03 04 0A 03 00 00 00 00 B8 85 4C 43 C6 13 40 70 08 00 00 00 08 00 00 00 01 00 00 00 62 68 65 6C 6C 6F 20 62 0A 50 4B 01 02 3F 03 0A 03 00 00 00 00 9A 85 4C 43 05 40 6D 5B 08 00 00 00 08 00 00 00 01 00 00 00 00 00 00 00 00 00 20 80 A4 81 00 00 00 00 61 50 4B 01 02 3F 03 0A 03 00 00 00 00 B8 85 4C 43 C6 13 40 70 08 00 00 00 08 00 00 00 01 00 00 00 00 00 00 00 00 00 20 80 A4 81 27 00 00 00 62 50 4B 05 06 00 00 00 00 02 00 02 00 5E 00 00 00 4E 00 00 00 00 00"
  bin_format = byte_array_of_zip_file.split.map {|s| s.to_i(16).chr}
  File.binwrite("mine_embedded.zip", bin_format.join)
end

def count_of_files_in(directory_path)
  Dir.glob(File.join(directory_path, '**', '*')).select { |file| File.file?(file) }.count
end
