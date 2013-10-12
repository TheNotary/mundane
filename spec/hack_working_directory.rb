require 'fileutils'
include FileUtils

# We need to change our working directory to a virtual directory so we don't risk 
# making a ton of files in ./out that will annoy testers... but we need to trigger
# this faked working directory only AFTER all the other requires are made in testing files
rm_rf fake_working_directory if File.exists? fake_working_directory
mkdir_p fake_working_directory
cd fake_working_directory



