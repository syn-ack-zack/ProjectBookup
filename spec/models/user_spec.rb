require 'spec_helper'

describe User do
   before{ 
      @user = User.new( userid: 'iankropp', password: 'capybara', favbook: 'iRobot', aboutme: 'I am tired', favauthor: 'Twain', favgenre:'funnies' )
      @secondUser = User.new( userid: 'shareef', password: 'capybara', favbook: 'iRobot', aboutme: 'I am tired', favauthor: 'Twain', favgenre:'funnies' )
   }
   subject { @user }
   #All fields are filled
   it { should respond_to(:userid)}
   it { should respond_to(:password)}
   it { should respond_to(:favbook)}
   it { should respond_to(:aboutme)}
   it { should respond_to(:favauthor)}
   it { should respond_to(:favgenre)}
 
   it {should be_valid}

   describe 'when only password and userid is present' do 
      before {
         @user.favbook = ''
         @user.aboutme = ''
         @user.favauthor = ''
         @user.favgenre = ''
      } 

      it {should be_valid}
   end

   #userid VALIDATION TESTS
   describe 'when user id is white space' do
      before{ @user.userid = '  '}
      it {should_not be_valid}
   end

   describe 'when user id is string of length zero' do
      before{ @user.userid = ''}
      it {should_not be_valid}
   end
   
   describe 'when user id is nil' do
      before{ @user.userid = nil}
      it {should_not be_valid}
   end

   describe 'when user id has leading whitespace' do
      before{ @user.userid = '  iankropp'}
      it {should be_valid}
   end

   describe 'when user id has trailing whitespace' do
      before{ @user.userid = 'iankropp   '}
      it {should be_valid}
   end

   describe 'when user id is multiple words' do
      before{ @user.userid = 'ian kropp'}
      it {should_not be_valid}
   end
   
   #TODO ask if this and the next one is a valid test
   describe 'when userid is not unique' do
      before{@user.userid = 'shareef'}
      it {should_not be_valid}
   end
   
   describe 'when two userids are only different by capitals' do
      before{@user.userid = 'Shareef'}
      it {should_not be_valid}
   end

   #password VALIDATION TESTS
   describe 'when password is just whitespace' do
      before { @user.userid = 'iankropp'; @user.password = ' '}
      it {should_not be_valid}
   end

   describe 'when password is a string of length zero' do
      before { @user.userid = 'iankropp'; @user.password = ''}
      it {should_not be_valid}
   end

   describe 'when password is nil' do
      before { @user.password = nil}
      it {should_not be_valid}
   end
   
   #TODO ask if this is a valid test 
   describe 'when password is  multiple words' do
      before { @user.password = 'what is up'}
      it {should_not be_valid}
   end

   5.times do |i|
      describe "when password is too small (#{i} characters long)" do
         before {@user.password = "a" * i}
         it {should_not be_valid}
      end
   end

   10.times do |i|
      describe "when password is too large (#{i + 36} characters long)" do
         before {@user.password = "a" * (i + 36)} 
         it {should_not be_valid}
      end
   end

   31.times do |i| 
      describe "when password is correct size (#{i + 5} characters)" do
           before {@user.password = "a" * (i + 5)}  
           it {should be_valid}
      end
   end

end
