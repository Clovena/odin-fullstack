# Sessions & Cookies

Sessions and Cookies are special Rails objects, similar to flashes. These are quasi-hashes that persist between requests. 

## Cookies

Cookies are k-v pairs that are stored in a browser until a specified expiration date is reached. They are commonly used to "bookmark" the user's place in a web page or to store display preferences. 

Rails offers a special hash named `cookies`, where each k-v pair is stored as a separate cookie on the user's browser. With each new server request, the browser will share all `cookies`, which can be accessed in controllers and views like a normal hash. 

If the dev were to save `cookies[:flavor] = "chocolate chip"`, you could pull up devtools and see this cookie there. Deleting it requires `cookies.delete(:flavor)`. To save multiple pieces of information, i.e. expirations, use the syntax `cookies[:flavor] = { value: "chocolate chip", expires: Time.now + 3600 }`.

## Sessions

A session represents all the actions a user takes while an app is meant to "remember" them (typicall until the window is closed). To identify a session, Rails stores a special cookie on the browser that contains a session hash. 

The `session` hash is accessible on the dev end similarly to `cookies`. It can be used, for instance, in the following manner:

```rb
# app/controllers/users_controller.rb

session[:current_user_id] = user.id # Set a session value

variable_value = session[:variable_key] # Access a session value

session[:key_to_be_reset] = nil # Reset a session key

reset_session # Reset the entire session
```

## Controller Filters

Controller filters run code within a controller at very specific times, e.g. before any other code has been run. An important use case for these filters is when a user requests to run an action that they are not authorized for. These filters are declared with `before_action` in the controller.

```rb
# app/controllers/users_controller.rb
before_action :require_login

private

def require_login
  if current_user.logged_in?
    # allow action to be performed
  else 
    redirect_to login_path
  end
end
```

Methods that use controller filters should be hidden behind the `private` designation so that only the controller itself can access them. 

`before_action` can be used in conjunction with `:only` and `:except`, e.g. `before_action :require_login, only: [ :edit, :update ]`.

Filters are inherited, so they can be included in e.g. `app/controllers/application_controller.rb` and be persisted through all controllers throughout an app.

## Authentication

At its core, authentication (auth) is design to ensure a user is who they say they are, e.g. by requiring a login or differentiating between a regular user vs an admin user (authorization0).

### Basic Authentication

Basic auth involves submitting a username and pwd to a form and sending it across the network. In Rails, `#http_basic_authenticate_with` achieves this.

### Digest Authentication

Digest auth in Rails relies on a `#before_action` running a method which calls upon `#authenticate_or_request_with_http_digest`. 

## Rolling Authentication

The problem with both basic and digest auth is that usernames and passwords get hardcoded somewhere. A better solution is to encrypt them via a digest form instead. 

In rolling auth, when a user submits their password, it gets converted to digest form and compared with an encrypted password previously stored from the user. Digest encryption is one-way, meaning its extremely difficult to decrypt a digest to retreive the original password. In fact, the most effective way is a massive guess-and-check. 

Rails offers `#has_secure_password` to be dropped into a User model. The User model should handle `password` and `password_confirmation` attributes, but `#has_secure_password` incercepts those values and converts them to digest. 

To init a new session, a new controller must be created (usually `sessions_controller.rb`) with routes for `:new`, `:create`, and `:destroy`. If the user passes the correct credentials, the `session` variable should store their id to be used for user auth. 

Rails also offers `remember_token` in the User model which allows for the user to be remembered across sessions. The token should be saved as a permanent cookie (e.g. `cookies.permanent[:remember_token])`). 

In summary: 
1. Add a column to Users which contains `password_digest`.
2. Build any validations for password and password-confirmation.
3. Turn the validated, unencrypted password into digest form and store it in `password_digest` by adding `#has_secure_password` to the User model. 
4. Build `sessions_controller.rb` to use `#authenticate`. 
5. Allow the user to be remembers with `:remember_token`. Save that token in `cookies.permanent`. 
6. On each page load that requires auth, use `#before_action` to check the `:remember_token`. If a user is not signed in, `redirect_to` the sign-in page. 

## Devise

Devise is a gem which handles much of the above. Devise prepackages a number of sign-up and sign-in tools across 10 modules. Configuration is customizable and dependent upon use case. 
