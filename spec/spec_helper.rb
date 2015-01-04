require 'pry'
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

def drop_dummy_files_in_working_directory_with_varying_names
  touch "/tmp/mundane-virtual-working-directory/houstonfoobar.txt"
  touch "/tmp/mundane-virtual-working-directory/a"
  touch "/tmp/mundane-virtual-working-directory/b."
  touch "/tmp/mundane-virtual-working-directory/c.txt"
  # touch "/tmp/mundane-virtual-working-directory/c.txtfdsdf"
end


def drop_dummy_zip_file
  # This string was coppied from a hex editor (bless) on linux
  byte_array_of_zip_file = "50 4B 03 04 0A 03 00 00 00 00 9A 85 4C 43 05 40 6D 5B 08 00 00 00 08 00 00 00 01 00 00 00 61 68 65 6C 6C 6F 20 61 0A 50 4B 03 04 0A 03 00 00 00 00 B8 85 4C 43 C6 13 40 70 08 00 00 00 08 00 00 00 01 00 00 00 62 68 65 6C 6C 6F 20 62 0A 50 4B 01 02 3F 03 0A 03 00 00 00 00 9A 85 4C 43 05 40 6D 5B 08 00 00 00 08 00 00 00 01 00 00 00 00 00 00 00 00 00 20 80 A4 81 00 00 00 00 61 50 4B 01 02 3F 03 0A 03 00 00 00 00 B8 85 4C 43 C6 13 40 70 08 00 00 00 08 00 00 00 01 00 00 00 00 00 00 00 00 00 20 80 A4 81 27 00 00 00 62 50 4B 05 06 00 00 00 00 02 00 02 00 5E 00 00 00 4E 00 00 00 00 00"
  bin_format = byte_array_of_zip_file.split.map {|s| s.to_i(16).chr}
  File.binwrite("embedded.zip", bin_format.join)
end

def drop_dummy_zip_file_with_folders
  byte_array_of_zip_file = "50 4B 03 04 0A 03 00 00 00 00 EA 72 4D 43 C6 13 40 70 08 00 00 00 08 00 00 00 05 00 00 00 62 2E 74 78 74 68 65 6C 6C 6F 20 62 0A 50 4B 03 04 14 03 00 00 00 00 80 72 4D 43 00 00 00 00 00 00 00 00 00 00 00 00 09 00 00 00 66 6F 6C 64 65 72 5F 61 2F 50 4B 03 04 0A 03 00 00 00 00 80 72 4D 43 05 40 6D 5B 08 00 00 00 08 00 00 00 0E 00 00 00 66 6F 6C 64 65 72 5F 61 2F 61 2E 74 78 74 68 65 6C 6C 6F 20 61 0A 50 4B 01 02 3F 03 0A 03 00 00 00 00 EA 72 4D 43 C6 13 40 70 08 00 00 00 08 00 00 00 05 00 00 00 00 00 00 00 00 00 20 80 A4 81 00 00 00 00 62 2E 74 78 74 50 4B 01 02 3F 03 14 03 00 00 00 00 80 72 4D 43 00 00 00 00 00 00 00 00 00 00 00 00 09 00 00 00 00 00 00 00 00 00 10 80 ED 41 2B 00 00 00 66 6F 6C 64 65 72 5F 61 2F 50 4B 01 02 3F 03 0A 03 00 00 00 00 80 72 4D 43 05 40 6D 5B 08 00 00 00 08 00 00 00 0E 00 00 00 00 00 00 00 00 00 20 80 A4 81 52 00 00 00 66 6F 6C 64 65 72 5F 61 2F 61 2E 74 78 74 50 4B 05 06 00 00 00 00 03 00 03 00 A6 00 00 00 86 00 00 00 00 00"
  bin_format = byte_array_of_zip_file.split.map {|s| s.to_i(16).chr}
  File.binwrite("embedded_with_folders.zip", bin_format.join)
end

def count_of_files_in(directory_path)
  Dir.glob(File.join(directory_path, '**', '*')).select { |file| File.file?(file) }.count
end
