# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
    Created my project using `rails new ChannelShowDemo`

- [x] Include at least one has_many relationship
    I have 7 has_many relationships in my application. Examples include: User has many Watchlists, a Channel has many Shows and a Show has many Listings.

- [x] Include at least one belongs_to relationship
    I have 7 belongs_to relationships in my application. Examples include: a Listing belongs to a User, a Watchlist and a Show, and a Show belongs to a Channel.

- [x] Include at least one has_many through relationship
    I have 6 has_many through relationships, including: a Show has many Genres through ShowGenres, a Show has many Watchlists and also Users through Listings, and a User has many Shows through Listings

- [X] The "through" part of the has_many through includes at least one user submittable attribute
    Listing is a join table that Watchlist, User, and Show have has_many relationships with. Listing has 3 user-submittable attributes: listing.user_status, listing.user_season, listing.fav, which describe the current user's association with this particular show on this particular watchlist.

- [X] Include reasonable validations for simple model objects - List of validations:
   Listing:
   1. validates that a user_season has been submitted and that it is a number greater than 0
   2. validates that a watchlist_id is unique on creation only, in order to prevent adding the same listing to the same watchlist
   3. uses a custom validation that the season a user is on is before or equal to the show's current_season attribute

   Show:
   1. validates that a show's title is unique within the scope of the channel (the same show can be added on different channels)
   2. validates that a show's season has been submitted and that it is a number greater than 0

   User:
   1. validates that an email is present and unique
   2. validates presence of username
   3. uses has_secure_password to validate that there is a password and, when creating a new user, it matches the password confirmation

   Watchlist:
   1. validates the watchlist's name is present

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      The Show model includes two ActiveRecord scope methods:
      1. Show.search -> a simple query feature to find a show by title which can be tested at /shows
      2. Show.behind_on -> to show a user which shows they are behind on based on season. When logged in, can be tested at /users/:id/shows/behind

- [x] Include signup
    Signup page is located at /users/new. It uses a simple form_for form that collects the user[:email], user[:username], user[:password] and user[:password_confirmation]. The form passes the data to the UsersController #create method, which creates the new user through strong params and User validations, then sets the session[:user_id] to the newly created user to log in the user.

- [x] Include login (how e.g. Devise)
    Login page is located at /login. It uses a simple form_for form that collects the user[:email], and user[:password]. The form passes the data to the SessionsController #create method, which finds the user in the database by their email, then uses bcrypt's has_secure_password to authenticate the user's password. Once authenticated, it sets the session[:user_id] to successfully log in the user.

- [x] Include logout (how e.g. Devise)
    The logout function is a form button that lives in the applications navbar, under the user's name. The URL path '/logout' sends the application to Sessions#destroy, where the session is cleared, effectively logging out the user and redirecting them to the home page.

- [x] Include third party signup/login
    OmniAuth for Google Plus was used as a third party signup/login tool. Options to signup and login using Google are available in the view, and choosing either of these routes through the appropriate OmniAuth routes, then back to a Users#google_login action, where we follow a similar process above for signing-up/logging-in/setting-session, but use the information from the auth hash.

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    Logging in gives users a nested index route to /users/:id/watchlists and a nested show route to /users/:id/watchlists/:id

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
    Adding a show to a watchlist gives us the nested route of /shows/:id/listings/new and editing the details of this listing on a show gives us /shows/:id/listings/:id/edit

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    Validations set above are checked and error messages are displayed, including styling for fields_with_errors div. You can verify this on any form in the application, by check out /shows/new for the most validation errors. 

Confirm:
- [x] The application is pretty DRY - moved repeated forms and views into partials
- [x] Limited logic in controllers - used model helpers as much as possible
- [x] Views use helper methods if appropriate - styling that is common in several places is in helper methods
- [x] Views use partials if appropriate - new/edit forms use partials, shared styling is also in partials
