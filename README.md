# Indie Joe 
![Indie Joe](http://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_photos/000/422/310/datas/gallery.jpg)

[Devpost Link](http://devpost.com/software/indie-joe)
##Inspiration
I (Vritant) make short films with a crew, and getting our films across to people is an incredibly difficult task. If we post it on Youtube, it is lost among the millions of videos, and no one is going to stumble upon a film named 'Bland Brandish'. To solve this problem, I thought of a website which is a mixture of YouTube and Netflix. 

##How it Works
Filmmakers upload their shorts by linking their already uploaded youtube videos and add tags (genre) to it. 
When it comes to a user who wants to surf through the website, he/she has an option to search by genre, most viewed or recommended. Recommended uses a recommendation engine that works by monitoring the user's previous views and also an initial set up, a similar setup to Apple Music.

## How we built it
On the back end, Indie Joe is powered by the Python web framework Flask and the simple database SQLite. I (Drew) started by making the database schema, and simple interfaces for the videos. For example, we made a function and page for searching and pages for viewing the video. 
We then integrated the front end into the application. We used bootstrap to create a simple user interface with a navbar and sidebar, and this was a shared resource through every view of the website. We then began the process of creating the complete user interfaces, using our wireframes as a guide.
Finally, we created the algorithm for predicting recommended videos. For the sake of simplicity, we decided to only integrate 5 genres into the database of movies. Using the genres, and tallying them according to the videos the user watched, we created a basic recommendation engine.
	
## Challenges we ran into
Figuring out what parameters to use for the Recommendation algorithm was definitely a big challenge, because it is a very subjective case. In the end we decided on having multipliers based on the user’s genre preferences.
The time constraints of the hackathon put a pressure on us to have a functioning project, which made for especially sloppy code which, if we continue development, might pose a challenge in expanding the app with more functionality.
Because VB had little experience with Python, we had to convert his algorithm from Java code to Python. This eventually worked, but we ran into issues when translating different data types and syntax between the two languages. For example, VB’s algorithm had a sorting function built in which was causing problems in our python implementation, so we switched to python’s built in sort function, which made for cleaner code overall.
Finally, it has been a challenge hosting the project on Microsoft Azure, because of the complexities of python and its dependency management system. We hope to have the code running on a Azure instance so we can keep developing on it.

## Accomplishments that we're proud of
We’re most proud of having a functional project to submit. We believe this product could be improved in the future as a viable business. If we decide to pursue this further, we have a solid foundation to build on top of.
We’re also proud that we figured out a recommendation algorithm that makes sense and predicts based on popularity of videos and the user’s preferences for certain genres.
Also, the Name and Logo.

## What we learned
Drew: I learned a ton about the Python Flask framework.This is my first project using Flask, and I love how it is minimal and allows you to achieve so much with such simple code. I also strengthened my SQL knowledge, learning a new database system, SQLite, and learned more about the basic commands such as select, update, tables, etc.

Vritant(VB): Researching and understanding the different kinds of recommendation algorithms was definitely an interesting experience. Learning how to weigh and rank different parameters was tricky, but a lot of fun. I also learnt some Python, HTML and CSS and some JavaScript while I tried to help Drew with the website. 


##Plans after the Hackathon
We will improve Indie Joe by refining the recommendation algorithms, not relying on YouTube and working on improving the user experience. We also hope to add a user accounts feature so that we can have access to more user’s data to improve recommendations, and hopefully end up making a person-person recommendation system.

