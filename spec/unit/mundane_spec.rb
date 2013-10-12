require './spec/spec_helper'

require './lib/mundane'

require './spec/hack_working_directory'   # this require must come LAST or reletive requires will fail hard

describe "test files_to_zips algos" do
  
  before :all do
    #Gas::Prompter.stub!(:user_wants_to_delete_all_ssh_data?).and_return("l")  # only delete's local keys
  end
  
  
  it 'should make 3 files in the out folder' do
    drop_dummy_files_in_working_directory
	  
    Mundane.files_to_zips
    count_of_files_in(fake_out_directory).should be 3
  end

end
