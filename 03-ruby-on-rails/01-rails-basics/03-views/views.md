# Views

The Views are generally the simplest part of the MVC structure. These can be HTML boilerplate, into which are inserted the variables received from the Controller.

Views are often called view templates. They are so named due to their tendency to have snippets of code designed for re-use across artifacts on the page.

Views live in the directory `app/views/controller_name/action_name.html.erb`.
- `controller_name` corresponds to the Controller
- `action_name.html.erb` corresponds to the method inside the Controller that was run immediately prior to rendering the view.

As an example: the `Posts` Controller, running the `#index` action, will implicitly render the View at `app/views/posts/index.html.erb` when it's complete. 

## Layouts

The first thing to note is that the named view template rendered from the Controller is not the entire webpage. It lacks a lot of the structure required in a completed html file, e.g. `DOCTYPE` or `<head>`.

The missing structure is meant to be declared in a separate file for use across pages. Quite convenient. These separate files are called layouts and live at `app/views/layouts`. 

For a brand new Rails app, the `application.html.erb` Layout is pretty basic. It can also be added to. 

In order to insert a specific page, we use good old `#yield`. i.e. the view template at `app/views/posts/index.html.erb` gets inserted wherever the `yield` statement is.

## Preprocessors

Embedded Ruby (`.erb`) allows Ruby code to be executed inside of an otherwise static html file.

*(HAML is another language, similar to ERB, that allows this behavior. Just be aware.)*

ERB needs special html tags `<%=` and `%>` in order to execute. Anything inside of those tags will render like html and execute like Ruby. 

For example:
- `<em><%= "I am emphasized" %></em>` will output
  - *I am emphasized*
- `<%= @user.first_name %>` will output
  - zac

The tags `<%` and `%>` can be used, with no equals sign, to run code in the background. That is, it won't display anything to the html template.

Similarly, `<%#` and `%>` are used to comment, not execute anything.

Here's a somewhat hellish looking example of a full block of code using erb.

```erb
  <% if current_user.signed_in? %>
    <ul>
      <% @users.each do |user| %>
        <li><%= user.first_name %></li>
      <% end %>
    </ul>
  <% else %>
    <strong>You must sign in!</strong>
  <% end %>
```
The `end` closings are still required!

In the end, this might render as:

```html
<ul>
  <li>Zac</li>
  <li>Bob</li>
  <li>Wumbo</li>
</ul>
```

All this computation occurs BEFORE the final html file is shipped to the browser. Hence the name preprocessor.

### Other Preprocessors

`.html.erb` is not the only type of preprocessor that might be useful.
- `.css.scss` preprocessors use a SASS preprocessor and become regular CSS files.
- `.js.coffee` preprocessors use something called Coffeescript and become regular Javascript files.

## View Partials

Rails allows views to be broken out into partials.
- This makes code more concise and easier to read
- This also allows for reuse of certain common patterns.

One example might be a form for creating a new user. Both the `#new` and `#edit` actions need to render some sort of form for the user, and usually the form itself is structured exactly the same. Often, it's desirable to develop the form in a file called something like `_user_form.html.erb`. Then, both `new.html.erb` and `edit.html.erb` can call that form in via `#yield`.

Here's a pretty simple user of a partial. 

```erb
# app/views/users/new.html.erb

<div class="new-user-form">
  <%= render "user_form" %>
</div>
```

Note that in this example, `_user_form.html.erb` begins with an underscore, but it is called via `render` using just the core portion of the name. 

If there is no directory in the partial's name, Rails will only look in the same folder as whichever view called it. In this case, as seen in the comment, the filepath would be `app/views/users`. 

Sometimes it makes sense to share partials across templates in multiple Controllers, lending to a subdirectory like `app/views/shared`. Then, `render` would be looking for `"shared/some_partial"`. 

### Local Variables and Partials

There are a couple ways to pass variables into partials, but some are bad practice. Technically, a partial has access to all the variables that the calling view template does, but this can cause some issues down the road. 

It's best to explicitly pass any variables to the partial. `render` allows a so-called options hash to be passed to it. One such option is the `:locals` key, which will contain the variables to be passed. 

`<%= render partial: "shared/some_partial", :locals => { :user => user } %>`

Then, to use the variable in the partials file, it can simply be called like a regular Ruby variable, no `@` required. 

Below is the shorthanded version of the above example.

`<%= render "shared/some_partial", :user => user %>`

This shorthand doesn't require the `:locals` declared explicitly.

### Implicit Partials

There are sometimes things that would warrant reuse so often that a shortcut would be extremely useful. 

Perhaps you want to list out all users, i.e. displaying a single user's first name, last name, email, etc. many times over, and doing so directly in `app/views/users/index.html.erb`. 

Something like this is usually tailor made for its own partial, something like `_user.html.erb`. This allows an even smaller partial to be used across cases.

The basic way to achieve this is as follows: 

```erb
# app/views/index.html.erb

<h1>Users</h1>
<ul>
  <% @users.each do |user| %>
    <%= render "user", :locals => { :user => user } %>
  <% end %>
</ul>
```

```erb
# app/views/_user.html.erb

<li>
  <%= "#{user.first_name} #{user.last_name}, #{user.email} %>
</li>
```

This is pretty nifty already, but Rails allows it to be shorthanded even further. 

```erb
# app/views/index.html.erb

<h1>Users</h1>
<ul>
  <% @users.each do |user| %>
    <%= render user %>
    # This automatically looks for a file called `_user.html.erb`
    # and automatically passes the `user` variable.
  <% end %>
</ul>
```

```erb
# app/views/_user.html.erb

<li>
  <%= "#{user.first_name} #{user.last_name}, #{user.email} %>
</li>
```

If it's necessary to iterate, e.g. render a list of multiple users, we can shorthand the `erb` `each` loop and use the below:

```erb
# app/views/index.html.erb

<h1>Users</h1>
<ul>
  <%= render @users %>
</ul>
```

This:
- Locates the `_user.html.erb` file
- Passes the correct `user` variable
- Loops over all users in the `@users` collection

## Helper Methods

`render` isn't the only method you can call within a view...

`#link_to`
- Creates an anchor tag url
- Instead of:
  - `<a href="<%= users_path %>">See All Users</a>`
- Rails accepts:
  - `<%= link_to "See All Users", users_path %>

Recall that `users_path` generates a relative url like `/users`, whereas `users_url` generates a full url like `http://www.app(.)com/users`. 

## Asset Tags

Rails can grab css, javascript, or images.

```erb
<%= stylesheet_link_tag "your_stylesheet" %>
<%= javascript_include_tag "your_javascript" %>
<%= image_tag "happy_cat.jpg" %>
```

The above renders as:

```html
<link href="/assets/your_stylesheet.css" media="all" rel="stylesheet">
<script src="/assets/your_javascript.js"></script>
<img src="/assets/happy_cat.jpg">
```
