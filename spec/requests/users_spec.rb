require 'spec_helper'

describe "User controllers" do
   it "should contain the word 'Bookup' on the splash page" do
     visit '/' 
     expect(page).to have_content('Bookup')
   end
end
