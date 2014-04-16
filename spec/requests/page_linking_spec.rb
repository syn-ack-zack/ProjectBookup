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
 
   pages = ['/profile', '/', '/logout','/books/new']
   links = {"About" => '/', "Sign Out" => "/", "Add a book!" => "/books/new", "Profile" => "/profile", "Sign Out" => "/logout"} 
   
   before { visit '/login' } 
   describe "Logged in page links" do 
      before :each do
         @user = User.new( userid: 'iankropp', password: 'capybara', favbook: 'iRobot', aboutme: 'I am tired', favauthor: 'Twain', favgenre:'funnies' )
         @user.save

         within ("form") do
            fill_in 'Username', :with => 'iankropp'
            fill_in 'Password', :with => 'capybara'
         end
         click_button('Log in')
      end
      pages.each do |p|
      
         before {visit p}

         describe "when you're in the #{p} page and you click on the" do 
            
            links.each do |buttonName, url| 
            
               it "#{buttonName} link to the #{url} page" do
                  if page.has_content?(buttonName) 
                     click_link_or_button buttonName
                     
                     if       url == '/'
                        expect(page).to have_content 'Welcome to Bookup Let us find your next book, in the simplest way possible.'
                        expect(page).to have_content 'How Do We Do It?'
                        expect(page).to have_content 'All you have to do is tell us the books you Like or Dislike!'
                        expect(page).to have_xpath "//img[@src='/assets/stackbook.png']"
                        expect(page).to have_content 'Save Time Spend your free time reading rather than searching'
                        expect(page).to have_xpath "//img[@src='/assets/openbook.png']"

                     elsif    url == '/books/new'
                        expect(page).to have_content 'Thank you for trying Bookup' 
                        expect(page).to have_content "Let's add a book to our collection"
                     elsif    url == '/profile'
                        expect(page).to have_content 'Youreafea recommendations' 
                        expect(page).to have_content 'The simple way to find your next read.'
                        expect(page).to have_content 'Not seeing a book you like?'
                       

                     end
                  end 
               end

            end

         end


      end


   end
   

end
