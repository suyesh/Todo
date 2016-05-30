# TODO
A Rails Application for To-Do Lists  

Built with Rails.

1. Devise for handling the browser sessions for users (There is no need for signups/Signin/Login/Logout)
2. bootstrap-sass for styling
3. Postgres to persist to-do list data between sessions for all users
4. pry for debugging
5. QRCODE generator for syncing sessions with other devices

## Features

1. No signups/Signins necessary. User's tasks will be annonymously saved in the Database.
 (Users can just scan the QR-Code to sync their Tasks with multiple devices)
2. Cool UI but could be cooler
3. Task saved in cloud. Even though there is no signups or signins, Your tasks are yours.
4. Mark tasks as complete. Tasks will be deleted from Database as its completed
5. Set Priority on tasks to easily see which tasks are important.
6. Elegant color coded priority badge on Tasks for identification
7. Full use of Ajax. There is no reloading of browser.


## Challenges Faced

1. Building Guest Sessions using Devise.
2. User interface (Still Work in progress).
3. My Plan was to add multiple lists on top of the sticky pads..Didn't work out but still work in progress.
