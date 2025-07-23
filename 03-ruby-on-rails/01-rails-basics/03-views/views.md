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

```html
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