# TODO
A Cool Rails Application for To-Do Lists  

#Built with Rails using following Gems

1. Devise for handling the browser sessions for users.
(There is no need for Signup/Signin/Login/Logout).
2. Bootstrap-sass for styling.
3. Postgres to persist to-do list data between sessions for all users.
4. Pry for debugging.
5. QRCODE generator for syncing sessions with other devices.
6. Animate.css for bouncing effect
7. Font Awesome

## Features

1. No Signup/Signin necessary. User's tasks will be anonymously saved in the Database.
(Users can just scan the QR-Code to sync their Tasks with multiple devices)
2. Cool UI but could be cooler.
(I'm more back end than front end)
3. Task saved in cloud. Even though there is no signup or signin, your tasks are yours.
4. Mark tasks as complete. Tasks will be deleted from Database as completed.
5. Set Priority on tasks to easily see which tasks are important.
6. Elegant color-coded priority badge on Tasks for identification.
7. Full use of Ajax. There is no reloading of browser.

#How it works

I wanted users to not have to signup or signin to use the website. Accounts for users are automatically created and they will be logged in until they clear browser cache and can be extended to use user IP. Once users are created anonymously, their IP can be stored to retrieve data if they wish to switch the browser.

The QRCODE Login is based on Session id. When you scan the QR CODE, the session guest user ID is passed in the params to the other device signing you in to the new device. 

```ruby
//   @user = User.find(params[:id])
//    session[:guest_user_id] = @user.id
```

My plan is to add multiple lists on top of the sticky pads. Still a work in progress.

## Challenges Faced

1. Building anonymous User creation and Guest Sessions using Devise. I wanted Users to not have to signup or signin to use the website. Its based on Cookie (Account for users are automatically created and they will be logged in until they clear browser cache) and can be extended to use User IP (Once users are created anonymously, their IP can be stored to retrieve data if they wish to switch the browser).
2. User interface.
3. My plan is to add multiple lists on top of the sticky pads. Still a work in progress.
