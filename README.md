# Bookup
A web application for finding a book to read based on likes and dislikes. Simply 'like' or 'dislike' a few books and recommendations will come in. 

----

Group Members 
- Matthew Faluotico
- Zack Nagaich
- Neil Madsen
- Ian Kropp
- Matt Ritter

----
# Organization and Structure

## Front end development

The front end was building using [BootFlat](http://bootflat.github.io/). BootFlat is a modified version of Bootstrap. It is essentially the same CSS classes, but modified to create a more modernized design. Because we have knowledge of Bootstrap from our past projects along with the provided documentation, this was really easy yo use.

Matt Faluotico primarily designed the front end of the web application. However, after he created extra CSS classes (found in style.css), the group used it to crate their own web pages.

The web page follows a aqua blue and white design. Most of the fancy text is either white on aqua or aqua on white. The group thought it was simple, modern, and pleasing to the eye.

## Recommendable

[Recommendable](https://github.com/davidcelis/recommendable) is the ruby gem used to create book recommendations. Rather than using a 5 star rating, we chose to use a simple like and dislike. Based on the books the user likes and dislikes, compared the books other users like and dislike, the gem provides a list of books that best fit the users. A simple `@books = @user.recommended_books 12` is used to return the top 12 recommended books for a user into an array. 

## Ruby and Rails

Using that array, the `...html.erb` file will print out each of these books in a beautiful thumbnail. The user can then say they like or dislike those suggested books. When the user clicks likes or dislike, an ajax method calls the controller that will update the database with this users information. By liking disliking books, the user will help generate suggestions for more books. 

## Database

Using SQLite the database stores users and books. Because of recommendable, the team used Redis. Redis stored the likes and dislikes for each user. Redis is not a sqlite database. It uses a flat database, which is a different format than a sql-based table Database. Because recommendable handles most of the interactions with the LIKES database, we did not work much with querying any information from this database. 



----
# Executing Bookup


---
# Contributions

- Matthew Faluotico
    + Primary front end development
    + 
- Zack Nagaich
    + Embedded Ruby wizard. 
- Neil Madsen
    + Project Manager
- Ian Kropp
    + King of testing 
    + Ian has the most experience with testing because of his job. 
- Matt Ritter
    + Database Master
    + Worked on database validation 