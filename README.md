README
Rails version 5.2.1

App for viewing and posting events, comments to events and RSVP to events with Rails and JavaScript.

USAGE
After starting your local server at http://localhost:3000/, you are able to create users, add/view/edit events and RSVPs, and leave comments.

INSTALL DIRECTIONS
Enter "git clone https://github.com/Dillorom/seattle-kids-events/tree/rails-js" into your terminal, while in your desired directory.
Navigate to newly created directory.
Run "bundle install" to install all gems.
Run "rake db:migrate" to populate database.
If you wish to have use of the Facebook login feature: visit "https://developers.facebook.com/apps" to make your own app. make a .env file and enter your facebook_key and facebook_secret into it. If you don't wish to use the Facebook login, you can skip this step.
Enter "rails s" in your terminal to start your local server. If you browser does not allow you to open the application due to security risks, run "thin start --ssl" in your terminal and go to http://localhost:3000/ on the browser.
Create a new user by clicking "Sign up" on the main index page. Then you will be able to create/edit your own events, RSVP to events and leave comments on events.
If you select "Admin" button when signing up, you will be set up as an admin. The admin status gives you permission to view/edit all the user profiles, events and comments. 
CONTRIBUTIONS
Bug reports and pull requests are welcome at https://github.com/Dillorom/seattle-kids-events/tree/rails-js".

LICENSE
This project has been licensed under the MIT open source license: 
https://github.com/Dillorom/seattle-kids-events/blob/rails-js/LICENSE.MD