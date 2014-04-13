require 'spec_helper'

describe "in the  user controllers," do
   subject{ page } 

   describe "the profile page" do 
      it "should have a valid link" do 
         visit '/profile'
      end
   end

   describe "the sign up page" do 
      before { visit '/signup'}
      it "should have a valid link " do 
      end

      names = ['usr', 'pswd', 'pswd', 'book', 'author', 'genre']
      types = ['text', 'password', 'password', 'text','text', 'text', 'submit']
      classes = ['form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'btn btn-primary'  ]

      #Basic layout tests
      it { should have_title 'Sign Up'}
      it { should have_content 'Thank you for trying Bookup'}
      it { should have_content 'Lets find you a book'}
      6.times do | i |
         it { should have_xpath "//form/input[#{i + 1}][@name = '#{names[i]}']" }
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
         fields = ['Username', 'Password','Password one more time...', 'Favorite Book', 'Favorite Author', 'Favorite Genre']
         fill = ['ian_kropp', 'capybara', 'capybara', 'capybara', 'Blink', 'Mark Twain','mystery']
         within("form")  do
            6.times do |i|
               fill_in fields[i], :with => fill[i]
            end
         end
         #TODO talk to Neil about what the proper URL is 
         #http://stackoverflow.com/questions/5228371/how-to-get-current-path-using-capybara
      end


   end

   describe "the splash page" do 
      before { visit root_path }
      
      it "should have a valid link" do 
      end

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
         names = ['usr', 'pswd', 'pswd', 'book', 'author', 'genre']
         types = ['text', 'password', 'password', 'text','text', 'text', 'submit']
         classes = ['form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'btn btn-primary'  ]

         click_link 'Sign Up'
         expect(page).to have_title 'Sign Up'
         expect(page).to have_content 'Thank you for trying Bookup'
         expect(page).to have_content 'Lets find you a book'
         6.times do | i |
            expect(page).to have_xpath "//form/input[#{i + 1}][@name = '#{names[i]}']"
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
