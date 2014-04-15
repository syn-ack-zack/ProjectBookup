require 'spec_helper'

describe Book do

   before {
      @book = Book.new( isbn: '9781602911727' , name: 'Tom Sawyer', author: 'Mark Twain', genre: 'AMURICAN' )
      @secondBook = Book.new( isbn: '9781954928401' , name: 'Huckle Dairy Flynn', author: 'Hark Pain', genre: 'Bohemian' )
   } 

   subject { @book }
   it { should respond_to(:name)}
   it { should respond_to(:author)}
   it { should respond_to(:isbn)}
   it { should respond_to(:genre)}
   
   it {should be_valid}

   #name TESTS
   describe 'when the name is a blank string' do
      before {
         @book.name = ''
      }
   
      it {should_not be_valid}
   end

   describe 'when the name is white space' do
      before {
         @book.name = '   '
      }
      it {should_not be_valid}
   end
   
   describe 'when the name is nil' do
      before {
         @book.name = nil
      }
      it {should_not be_valid}

   end

   describe 'when the name is not unique' do
      before {
         @secondBook.name = 'cats'
         @book.name = 'cats'
      }
      it {should_not be_valid}

   end

   describe 'when the name length is one' do
      before {
         @book.name = 'c'
      }
      it {should_not be_valid}

   end
   
   20.times do |i|
      describe "when the name length is valid (#{i + 2}  characters)" do
         before {
            @book.name = "c" * (i + 2)
         } 
         it {should be_valid}
      end
   end

      
   
   #author TESTS
   describe 'when the author is a blank string' do
      before {
         @book.name = 'fish tales'
         @book.author = ''
      }
      it {should_not be_valid}
   end

   describe 'when the author is white space' do
      before {
         @book.author = ' '
      }
      it {should_not be_valid}
   end

   describe 'when the author is nil' do
      before {
         @book.author = nil
      }
      it {should_not be_valid}
   end

   describe 'when the author name is one character long' do
      before {
         @book.author = 'c'
      }
      it {should_not be_valid}
     
   end 

   34.times do |i|
      describe "when the author name is valid (#{i+2} characters)" do
         before {
            @book.author = "c" * (i + 2)
         }
         it {should be_valid}
      end
   end

   33.times do |i|
      describe "when the author name is too long (#{i + 36} characters)" do
         before {
            @book.author = "c" * (i + 36)
         }
         it {should_not be_valid}
      end
   end

   #isbn TESTS
   describe 'when the isbn is 13 characters long' do
      before {
         @book.author = "Commadore perry"
         @book.isbn = "9193915811918"
      }         
      it {should be_valid}

   end

   describe 'when the isbn is not 13 characters long (12)' do
      before {
         @book.author = "Commadore perry"
         @book.isbn = "919391581191"
      }         
      it {should_not be_valid}
   end

   describe 'when the isbn is not 13 characters long (14)' do
      before {
         @book.author = "Commadore perry"
         @book.isbn = "91939158119191"
      }         
      it {should_not be_valid}
   end

   describe 'when the isbn contains non numeric characters' do 
      before {
         @book.author = "Commadore perry"
         @book.isbn = "91939158119a1"
      }         
      it {should_not be_valid}
   end




end

