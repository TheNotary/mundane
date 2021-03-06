require './spec/spec_helper'
require './lib/mundane'

require './spec/hack_working_directory'   # this require must come LAST or reletive requires will fail hard... oh wait... if there are more test files... everything foobars...

describe "test the algos" do
  
  before :each do
    extend Mundane::FileWorker
  end

  describe "test files_to_zips algo" do
    
    before :each do
      Mundane::FilesToZips.stub(:prompt_user).and_return(true)
      
      clean_dummy_working_directory
    end
    
    after :each do
      Mundane::FilesToZips.unstub(:prompt_user)
    end
    
    it 'should make 3 files in the out folder' do
      drop_dummy_files_in_working_directory
      
      Mundane.files_to_zips
      count_of_files_in(fake_out_directory).should be 3
    end
    
    
  end
  
  describe "test zips_to_files algo" do
    before :each do
      Mundane::ZipsToFiles.stub(:prompt_user).and_return(true)
      
      clean_dummy_working_directory
    end
    
    after :each do
      Mundane::ZipsToFiles.unstub(:prompt_user)
    end
    
    it 'should make 2 files in the out folder' do
      drop_dummy_zip_file

      Mundane.zips_to_files
      count_of_files_in(fake_out_directory).should be 2
    end
    
    it "should work on zip archives that have a folder in them" do
      drop_dummy_zip_file_with_folders
      
      Mundane.zips_to_files
      count_of_files_in(fake_out_directory).should be 2
    end
    
    it "should ignore files that aren't really archives" do
      drop_dummy_zip_file
      drop_dummy_files_in_working_directory
      
      Mundane.zips_to_files
      count_of_files_in(fake_out_directory).should be 2
    end
    
  end
  
  describe "test file_name_shortener" do
    before :each do
      Mundane::TruncateFileNames.stub(:prompt_user).and_return(true)
      
      clean_dummy_working_directory
    end
    
    after :each do
      Mundane::TruncateFileNames.unstub(:prompt_user)
      clean_dummy_working_directory
    end
    
    it "should shorten all the filenames to the requested length" do
      extend Mundane::FileWorker
      
      drop_dummy_files_in_working_directory_with_varying_names
      
      Mundane.truncate_file_names(8)
      
      files = get_files_in_current_folder
      
      files.each do |f| 
        (f.length <= 8).should be_true
      end
    end
    
  end
  
  describe "test ban_from_name" do
    before :each do
      Mundane::BanFromName.stub(:prompt_user).and_return(true)
      
      clean_dummy_working_directory
    end
    
    after :each do
      Mundane::BanFromName.unstub(:prompt_user)
      clean_dummy_working_directory
    end
    
    it "should ban chars from name specified" do
      banned_chars = ",$"
      
      drop_dummy_files_in_working_directory_with_offending_names
      
      Mundane.ban_from_name(banned_chars)
      
      files = get_files_in_current_folder
      
      files.each do |f| 
        banned_chars.split("").each do |c|
          f.include?(c).should be_false
        end
      end
      
      binding.pry
    end
    
  end
    
  
  
  describe "prompter unit test..." do
    before :each do
      clean_dummy_working_directory
    end
    
    it 'should have a pleasant prompt message' do
      drop_dummy_files_in_working_directory
      
      prompt = "hello %count_targeted_files% bye"
      Mundane::Prompter.construct_informative_message(prompt).should eq "hello 3 bye"
    end
  end
  
  
end