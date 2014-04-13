require 'spec_helper'

describe "in the  user controllers," do

   subject{ page } 

   #PROFILE PAGE
   describe "the profile page" do 
      it "should have a valid link" do 
         visit '/profile'
      end
      #TODO ...um start this
   end

   #SIGN UP PAGE
   describe "the sign up page" do 
      before { visit '/signup'}
      it "should have a valid link " do 
      end

      id = ['user_username', 'user_password', 'user_confirmpassword', 'user_favbook', 'user_favauthor','user_favgenre', 'user_aboutme']
      types = ['text', 'password', 'password', 'text','text', 'text', 'submit']
      classes = ['form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'btn btn-primary'  ]

      #Basic layout tests
      it { should have_title 'Sign Up'}
      it { should have_content 'Thank you for trying Bookup'}
      it { should have_content 'Lets find you a book'}
      6.times do | i |
         it { should have_xpath "//form/input[#{i + 1}][@id = '#{id[i]}']" }
      end 

      7.times do |i|
         it { should have_xpath "//form/input[#{i + 1}][@type = '#{types[i]}']"} 
      end

      7.times do |i|
         it { should have_xpath "//form/input[#{i + 1}][@class = '#{classes[i]}']" } 
      end
      
      #Link tests
      it "should create the correct URL when you hit 'login'" do
         click_link 'Log in'
         fields = ['Username', 'Password', 'user[confirmpassword]']
         fill = ['ian_kropp', 'capybara','capybara']
         #TODO figure out why this is breaking
         within("form")  do
            fields.length.times do |i|
               fill_in fields[i], :with => fill[i]
            end
         end
         #TODO talk to Neil about what the proper URL is 
         #http://stackoverflow.com/questions/5228371/how-to-get-current-path-using-capybara
      end

   end
   #THE SPLASH PAGE
   describe "the splash page" do 
      before { visit root_path }
      
      it "should have a valid link" do 
      end
      #TODO add basic layout tests

      it "should have valid About link" do 
         click_link 'About'
         expect(page).to have_title 'Bookup'
         expect(page).to have_content 'Bookup'
         expect(page).to have_content 'Let us find your next book' 
         expect(page).to have_content 'In the simplest way possible' 
      end

      it "should have a valid Log In link" do 
         click_link 'Log in'
         expect(page).to have_title 'Login'
         expect(page).to have_content 'Welcome to Bookup'
         expect(page).to have_content "Let's find you a book"
         expect(page).to have_xpath '//form/label'
         expect(page).to have_xpath '//form/input'
         expect(page).to have_xpath '//form/br'
         expect(page).to have_xpath '//form/div'
      end

      it "should have a valid Sign Up link" do
         click_link 'Sign Up'
         ids = ['user_username', 'user_password', 'user_confirmpassword', 'user_favbook', 'user_favauthor','user_favgenre', 'user_aboutme']
         types = ['text', 'password', 'password', 'text','text', 'text', 'submit']
         classes = ['form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'btn btn-primary'  ]

         click_link 'Sign Up'
         expect(page).to have_title 'Sign Up'
         expect(page).to have_content 'Thank you for trying Bookup'
         expect(page).to have_content 'Lets find you a book'
         6.times do | i |
            expect(page).to have_xpath "//form/input[#{i + 1}][@id = '#{ids[i]}']"
         end 
         7.times do |i|
            expect(page).to have_xpath "//form/input[#{i + 1}][@type = '#{types[i]}']"
         end

         7.times do |i|
            expect(page).to have_xpath "//form/input[#{i + 1}][@class = '#{classes[i]}']"
         end
      end 
   end
end
