require 'spec_helper'

describe "in the  user controllers," do

   subject{ page } 

  
   #TESTS FOR LOGGED OUT 
   pages = ['/', '/signup', '/login'] 
   #TODO change 'log in' thing
   links = {"About" => '/', "Bookup" => '/', "Sign Up" => '/signup',"Want to try it out?" => 'signup', "Log in" => '/login' }
   #iterate through each page
   pages.each do |p|
      #visit the page
      before { visit p } 
      describe "when you're in the #{p} page and you click on the"  do 
         #visit each of the links
         links.each do |buttonName, url|  
            it "#{buttonName} link to the #{url} page" do
               #check if the page even has the link
               if page.has_content?(buttonName) 
                  click_link buttonName
               if     url == '/' 
                  #do splash page tests
                  expect(page).to have_content 'Welcome to Bookup Let us find your next book, in the simplest way possible.'
                  expect(page).to have_content 'How Do We Do It?'
                  expect(page).to have_content 'All you have to do is tell us the books you Like or Dislike!'
                  expect(page).to have_xpath "//img[@src='/assets/stackbook.png']"
                  expect(page).to have_content 'Save Time Spend your free time reading rather than searching'
                  expect(page).to have_xpath "//img[@src='/assets/openbook.png']"
               elsif    url == '/signup' 
                  #do signup page tests
                  ids = ['user_username', 'user_password', 'user_confirmpassword', 'user_favbook', 'user_favauthor','user_favgenre', 'user_aboutme']
                  types = ['text', 'password', 'password', 'text','text', 'text', 'submit']
                  classes = ['form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'btn btn-primary'  ]
                  #TODO change Lets
                  expect(page).to have_content 'Thank you for trying Bookup Lets find you a book'
                  6.times do | i |
                     expect(page).to have_xpath "//form/input[#{i + 1}][@id = '#{ids[i]}']"
                  end 
                  7.times do |i|
                     expect(page).to have_xpath "//form/input[#{i + 1}][@type = '#{types[i]}']"
                  end

                  7.times do |i|
                    expect(page).to have_xpath "//form/input[#{i + 1}][@class = '#{classes[i]}']"
                  end                 
               elsif    url == '/login' 
                  #do login page tests
                  
                  ids = ['session_username', 'session_password']
                  types = ['text', 'password', 'submit']
                  classes = ['form-control', 'form-control', 'btn btn-primary'  ]

                  expect(page).to have_content "Welcome back to Bookup Lets find you a book"
                  2.times do | i |
                     expect(page).to have_xpath "//form/input[#{i + 1}][@id = '#{ids[i]}']"
                  end 
                  3.times do |i|
                     expect(page).to have_xpath "//form/input[#{i + 1}][@type = '#{types[i]}']"
                  end

                  3.times do |i|
                    expect(page).to have_xpath "//form/input[#{i + 1}][@class = '#{classes[i]}']"
                  end                 

               end
               end
            end
         end
      end
   end
   #TESTS FOR LOGGED IN 
   pages = [] 
   
   links = {}
   #first, we need to log in

   before {
      @user = User.new( userid: 'iankropp', password: 'capybara', favbook: 'iRobot', aboutme: 'I am tired', favauthor: 'Twain', favgenre:'funnies' )
      visit '/login'
      fill_in 'Username', :with => 'iankropp'
      fill_in 'Password', :with => 'capybara'
      click_link 'Log in'
   } 
   describe "when you succesfully log in," do 
      it "shoud get the profile page" do 
         expect(page).to have_content "Your Recommendations"
      end 
   end 

   #iterate through each page
   pages.each do |p|
      #visit the page
      before { visit p } 
      describe "when you're in the #{p} page and you click on the"  do 
         #visit each of the links
         links.each do |buttonName, url|  
            it "#{buttonName} link to the #{url} page" do
               #check if the page even has the link
               if page.has_content?(buttonName) 
                  click_link buttonName
                  if     url == '/' 
              
                  elsif    url == '/signup' 
             
                  elsif    url == '/login' 
         
               end
               end
            end
         end
      end
   end

#
#   #SIGN UP PAGE
#   describe "the sign up page" do 
#      before { visit '/signup'}
#      it "should have a valid link " do 
#      end
#
#      id = ['user_username', 'user_password', 'user_confirmpassword', 'user_favbook', 'user_favauthor','user_favgenre', 'user_aboutme']
#      types = ['text', 'password', 'password', 'text','text', 'text', 'submit']
#      classes = ['form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'btn btn-primary'  ]
#
#      #Basic layout tests
#      it { should have_title 'Sign Up'}
#      it { should have_content 'Thank you for trying Bookup'}
#      it { should have_content 'Lets find you a book'}
#      6.times do | i |
#         it { should have_xpath "//form/input[#{i + 1}][@id = '#{id[i]}']" }
#      end 
#
#      7.times do |i|
#         it { should have_xpath "//form/input[#{i + 1}][@type = '#{types[i]}']"} 
#      end
#
#      7.times do |i|
#         it { should have_xpath "//form/input[#{i + 1}][@class = '#{classes[i]}']" } 
#      end
#      
#      #Link tests
#      it "should create the correct URL when you hit 'login'" do
#         click_link 'Log in'
#         fields = ['Username', 'Password', 'confirmpassword']
#         fill = ['ian_kropp', 'capybara','capybara']
#         #TODO figure out why this is breaking
#         within("form")  do
#            fields.length.times do |i|
#               fill_in fields[i], :with => fill[i]
#            end
#         end
#         #TODO talk to Neil about what the proper URL is 
#         #http://stackoverflow.com/questions/5228371/how-to-get-current-path-using-capybara
#      end
#
#   end
#   #THE SPLASH PAGE
#   describe "the splash page" do 
#      before { visit root_path }
#      
#      it "should have a valid link" do 
#      end
#      #TODO add basic layout tests
#
#      it "should have valid About link" do 
#         click_link 'About'
#         expect(page).to have_title 'Bookup'
#         expect(page).to have_content 'Bookup'
#         expect(page).to have_content 'Let us find your next book' 
#         expect(page).to have_content 'In the simplest way possible' 
#      end
#
#      it "should have a valid Log In link" do 
#         click_link 'Log in'
#         expect(page).to have_title 'Login'
#         expect(page).to have_content 'Welcome to Bookup'
#         expect(page).to have_content "Let's find you a book"
#         expect(page).to have_xpath '//form/label'
#         expect(page).to have_xpath '//form/input'
#         expect(page).to have_xpath '//form/br'
#         expect(page).to have_xpath '//form/div'
#      end
#
#      it "should have a valid Sign Up link" do
#         click_link 'Sign Up'
#         ids = ['user_username', 'user_password', 'user_confirmpassword', 'user_favbook', 'user_favauthor','user_favgenre', 'user_aboutme']
#         types = ['text', 'password', 'password', 'text','text', 'text', 'submit']
#         classes = ['form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'form-control', 'btn btn-primary'  ]
#
#         click_link 'Sign Up'
#         expect(page).to have_title 'Sign Up'
#         expect(page).to have_content 'Thank you for trying Bookup'
#         expect(page).to have_content 'Lets find you a book'
#         6.times do | i |
#            expect(page).to have_xpath "//form/input[#{i + 1}][@id = '#{ids[i]}']"
#         end 
#         7.times do |i|
#            expect(page).to have_xpath "//form/input[#{i + 1}][@type = '#{types[i]}']"
#         end
#
#         7.times do |i|
#           expect(page).to have_xpath "//form/input[#{i + 1}][@class = '#{classes[i]}']"
#         end
#      end 
#   end
end
