# Forms

We have encountered forms before in html. 

```html
<form action="/somepath" method="post">
  <input type="text" name="description">
  <input type="radio" name="selection">
  <!-- other inputs here -->
   <input type="submit" value="Submit">
</form>
```

But we are developing in Rails as well, so we need to add Rails capabilities to forms. 

## Forms in Rails

Rails emphasizes the `name` attribute of any `<input>` tag, as it gets used as a key when generating a `params` hash. The above sample form would generate a `params` hash with two keys: `:description` and `:selection`. These can then be accessed using e.g. `params[:description]`. 

Data is often better off being nested within a hash. e.g. for `params[:user]`, it can be beneficial to return a nested hash with things like `{ first_name: "foo", last_name: "bar", email: "foo@bar.com" }`, i.e. a nested hash. 

On a form, it is straightforward to nest data in this fashion. 

```html
<input type="text" name="user[first_name]">
<input type="text" name="user[last_name]">
<input type="text" name="user[email]">
```

These inputs will get transformed into a nested hash called `user` within `params`. The server output (`$ rails server`) will be `Parameters: { ... , "user"=>{"first_name"=>"foo","last_name"=>"bar","email"=>"foo@bar.com"} }`

## `form_with`

The method `#form_with` can be used in erb files to render an html form easily. 

```rb
<%= form_with(url: "/search", method: "get") do %>
  <%= label_tag(:query, "Search for:") %>
  <%= text_field_tag(:query) %>
  <%= submit_tag("Search") %>
<% end %>
```

will render as:

```html
<form accept-charset="UTF-8" action="/search" method="get">
  <label for="query">Search for:</label>
  <input id="query" name="query" type="text"> 
  # using form_with causes id to equal name
  <input
    name="commit"
    type="submit"
    value="Search"
    data-disable-with="Search">
</form>
```

### Using Models with `form_with`

It is likely that a form should act upon the attributes of an existing model. To do so, pass `form_with` a model object, and it will submit the form to the url for that object.

```rb
# app/controllers/articles_controller.rb
def new
  @article = Article.new
end


# app/views/articles/new.html.erb
<%= form_with model: @article do |form| %>
  <%= form.text_field :title %>
  <%= form.submit "Create" %>
<% end %>
```

These two Rails files will produce the following html:

```html
<form action="/articles" method="post">
  <input
    name="authenticity_token"
    type="hidden"
    value="f8jsDS38s9fjZjfi343j89dgsZSJF/5js="
  >
  <input type="text" name="article[title]">
  <input type="submit" value="Create">
</form>
```

Rails will automatically check if the provided model object has been saved yet. If it is a new object, it will send the form to `#create`. If the object has been previously saved, i.e. if the object is being edited, it will automatically send to `#update`. 

## Validations

When form inputs fail validation, it's common to display error messages so the user knows what went wrong. Recall that when Rails tries and fails to validate an object, it attaches a new set of fields to the object called `errors`. They can be viewed with `object_name.errors`. These errors have a couple convenient helper methods to display the messages. These are used in the code below.

```rb
<% if @post.errors.any? %>
  <div id="error-explanation">
    <h2>
      <%= pluralize(@post.errors.count, "error") %> prevented save...
    </h2>

    <ul>
    <% @post.errors.full_messages.each do |msg| %>
      <li><%= msg %></li>
    <% end %>
    </ul>
  </div>
<% end %>
```

## Patch and Delete Submissions

Forms are not typically designed to delete objects outright; they are configured to align with browser-supported GET and POST requests. Rails provides a workaround, however: `form_with(url: search_path, method: "patch")`. This is equivalent to the html `<input name="_method" type="hidden" value="patch">`. 
