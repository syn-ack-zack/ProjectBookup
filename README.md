# Bookup
A web application for finding a book to read based on likes and dislikes. Simply 'like' or 'dislike' a few books and recommendations will come in. 

----

### Group Members 
- Matthew Faluotico
- Zack Nagaich
- Neil Madsen
- Ian Kropp
- Matt Ritter

----

# Organization and Structure

## Front end development

The front end was built using [BootFlat](http://bootflat.github.io/). BootFlat is a modified version of Bootstrap. It is essentially the same CSS classes, but modified to create a more modernized design. Because we have knowledge of Bootstrap from our past projects, along with the provided documentation, this was really easy to use.

Matt Faluotico primarily designed the front end of the web application. However, after he created extra CSS classes (found in style.css), the group used it to create their own web pages.

The web page follows an aqua blue and white design. Most of the styled text is either white on aqua or aqua on white. The group thought it was simple, modern, and pleasing to the eye.

## Recommendable

[Recommendable](https://github.com/davidcelis/recommendable) is the ruby gem used to create book recommendations. Rather than using a 5 star rating, we chose to use a simple like and dislike. Based on the books the user likes and dislikes, compared the books other users like and dislike, the gem provides a list of books that best fit the users. A simple `@books = @user.recommended_books 12` is used to return the top 12 recommended books for a user into an array. 

## Ruby and Rails

Using that array, the `...html.erb` file will print out each of these books in a beautiful thumbnail. The user can then say they like or dislike those suggested books. When the user clicks likes or dislike, an ajax method calls the controller that will update the database with this users information. By liking or disliking books, the user will help generate suggestions for more books. 

## Database

Using SQLite, the database will store user information and books. Because of recommendable, the team used Redis, which stores the likes and dislikes for each user. Redis is not a sqlite database as it uses a flat database, which is a different format than a sql-based table database. Because recommendable handles most of the interactions with the LIKES database, we did not work much with querying any information from this database. 


# What we learned

The team used **Git** and **GitHub** throughout the project. In the beginning, it was the largest bottleneck. The correct use was unknown to the team. After a week or so, everything seemed to start working a lot better. Using issues on GitHub helped the team organize tasks. The biggest problem with GitHub was merging files line by line. The team was never able to find a good solution for this.

The difference between flat and SQL databases was explained a bit more by working on this project. Different actions require different database styles. Because of the way recommendable worked, SQL-like queries would not provide good results. 



----
# Executing Bookup

1. Clone the project to a directory on your source machine 
2. Redis must be installed on the source system. To install redis, run `apt-get redis-server` in the command line
3. Run bundle install to gather all the required gems from the `gemfile`
4. To set up the database, run `rake db:migrate:reset` followed by `rake db:seed` to populate the database from the seed file. 
3. Run `rails server` in the directory of the project
4. Navigate to `localhost:3000`
5. You should be at the home screen. You have two options, 1) Create an account or 2) Log in with our default account (contains a handful of likes and dislikes)
    
    USER: MattRitter

    PASSWORD: BookupRules

6. Profile will show your suggested books, by liking and disliking them you will gradually update the suggested books.
7. You can add a book if it isn't already in the bookup database.

----
# Executing rpsec tests

1. $ rake db:migrate
2. $ rake test:prepare
3. $ rspec spec/


---
# Contributions

Overall, the team all worked equally on the ruby code. Often, rather than splitting up jobs, the team would all work around the same computer, shooting off ideas of how to implement a specific task or take a stab at an error. This is how most of our controllers were written. After a general idea was in place, the members would continue on their own. Matt Ritter and Zach primarily handled presenting model information onto the view. Neil handled most of the back end information, updating controllers, managing the recommendable database. Matt Ritter handled validation and database set. Ian made sure everything was working correctly the entire project by leading tests and reporting and usually activity. 

- Matthew Faluotico
    - Primary front end development
        - Handled most of the design
    - Wrote the controller for profile and helped with the search controller
        - Profile and Search are similar, Matt and Zach worked on this
- Zack Nagaich
    - Embedded Ruby wizard. 
    - Wrote the search controller
        - Very similar to profile, worked with Matt Faluotico on this
    * Helped create SQL database with Matt Ritter
- Neil Madsen
    - Project Manager
    - Created actions for all of the buttons 
    - Parse data from Wikipedia 
    - Build database for likes with recommendable 
- Ian Kropp
    - King of testing
    - Created the add books page and helped Matt Ritter with validation for adding a new book
    - Helped populate seed
- Matt Ritter
    - Database Sorcerer
    - Created the migrations with Zack to setup database
    - Created user and book validations and model methods
    - Helped populate seed file
