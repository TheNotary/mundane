require './spec/spec_helper'

require './lib/mundane'

require './spec/hack_working_directory'   # this require must come LAST or reletive requires will fail hard... oh wait... if there are more test files... everything foobars...

describe "test files_to_zips algos" do
  
  before :each do
    Mundane::FilesToZips.stub!(:ask_user_if_theyd_like_to_make_zips).and_return(true)
  end
  
  after :each do
    Mundane::FilesToZips.unstub!(:ask_user_if_theyd_like_to_make_zips)
  end
  
  it 'should make 3 files in the out folder' do
    drop_dummy_files_in_working_directory
    
    Mundane.files_to_zips
    count_of_files_in(fake_out_directory).should be 3
  end

end
