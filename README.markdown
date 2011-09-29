Example of adding a gem and before filter
=========================================

Although this example uses the Devise gem, this is not an example how to use
Devise.

Steps to create this project:

If a step starts with a '$' (dollar sign) this means it's something to type at a
shell prompt.

## Start a new rails project and (optionally) create a git repo for it.

1. $ rails new happy_go_lucky_farm
2. $ cd happy_go_lucky_farm/
3. $ git init
4. $ git add .
5. $ git commit -m "initial commit"

## Generate a scaffold for vegetables:

1. $ rails generate --help # This step is just to show what generators are available
2. $ rails generate scaffold Vegetable name:string description:text price_per_unit:integer unit:string
3. $ bundle
4. $ rake db:migrate
5. $ rails s
6. When the server comes up, point your browser at http://localhost:3000/vegetables. Feel free to add
   some data.
7. git add .
8. git commit -m "Added scaffold for vegetables"

## Add the Devise gem:

1. Open up 'Gemfile' in an editor, and add the line "gem 'devise'". Save the file.
2. $ bundle # The output should include Devise and its dependencies
3. $ rails generate --help # You should see some new generators that Devise has added
4. $ devise:install
5. Follow the instructions that are printed out by Devise. One of them will be to open
   up and look at the initializer for Devise. Feel free to change the email address
   that Devise will use, but it's not necessary since we won't really be sending
   emails as part of this exercise (but, of course, in real life use you will want
   to use a different email). One of the instructions will be to edit the 'root :to ...'
   line in the routes.rb file. Have this go to "vegetables#index".
6. $ rm public/index.html # We're removing this so the route change above will be visible
7. Commit to git if you'd like. This can be helpful if you want to see what changes
   are made by the commands we type at the shell prompt.

## Add a user model for Devise and add a before filter:

In normal usage, you might already have a User model.  In this case, we're just
going to let Devise generate one. As a result, there will only be fields for
things like email and password, and not for things that you might expect such
as first and last name.

1. $ rails generate devise User
2. $ rake db:migrate
3. Edit the file vegetables_controller.rb. Under 'class VegetablesController ...',
   add the line:

   before_filter :authenticate_user!, :except => [:index, :show]

4. Save the file
5. Optionally edit routes.rb so that the front page of the site goes to the vegetable
5. $ rails s
6. Go to http://localhost:3000
7. When you try to make a change (e.g. editing or adding a new record), you'll notice
   that you're asked to sign in or sign up.


