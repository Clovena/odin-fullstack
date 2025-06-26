# Routing

A router is responsible for matching the HTTP verb (GET, POST, PUT, DELETE) to a controller action. This is a basic but essential function. If the router cannot find a match, it throws an error.

In Rails, all parameters are grabbed and stored in a hash called `params`. This hash can be used later in the controller. This is ideal for form submissions or other inputs that will be used as data in Ruby objects.

## Root URL

The most important route in a project is the root URL. This can be defined by:
`root to: "scdfl#index"`
This points to the `scdfl` controller, and the `index` action or method.

"Action" really just means "the method with that name inside the controller."

## RESTful Routes

There are seven main types of actions that are considered RESTful, or "REpresentational State Transfer"-ful.

1. GET all post (`index` in Rails)
1. GET one specific resource (`show`)
1. GET the page which allows creation of a new resource (`new`)
1. POST data just provided back to the server to create a resource (`create`)
1. GET the page which allows editing of an existing resource (`edit`)
1. PUT data just provided to an existing resource (`update`)
1. DELETE one specific resource (`destroy`)

To write these out the long way in Rails:

```rb
get '/posts', to: 'posts#index'
get '/posts/new', to: 'posts#new'
get '/posts/:id', to: 'posts#show'
post '/posts', to: 'posts#create'
get '/posts/:id/edit', to: 'posts#edit'
put '/posts/:id', to: 'posts#update'
delete '/posts/:id', to: 'posts#destroy'
```

Each of these routes is essentially a Ruby method which matches particular combos of HTTP verbs and URL destinations with the correct controller action.

- Several routes submit to the same URL, e.g. `'/posts/:id'`. Notice however that each instance of the same URL uses a different HTTP verb.
- The `id` field is prepended by a colon `:` which tells Rails to look for any value provided and save it in the `params` hash under that symbol name.
  - e.g. for `//:id`, the hash will have the symbol key `:id` with a value set to the provided value.

To achieve those seven routes in shorthand in Rails, one line is necessary:
`resources :posts`

This outputs those seven routes automatically. The parameter provided after the keyword `resources` can be anything, and Rails will auto-create the seven routes for that path. It can be `posts` or `rosters` or `surveys` or anything that's concise and descriptive.

## Route Helpers

In a Rails project, the command `rails routes` (or `rails routes --expanded`) will output all available routes.

On the client side, routes can be seen by navigating to `/rails/info/routes` after the localhost domain. 

The HTTP Verb and URL (or path) can be seen in the middle, and the Controller Action is to the right of them. The so-called name of the route is the furthest left field in this view. 

Some paths will include the syntax `(.:format)`, which indicates that a file extension is accepted (but not required).

### Retrieving Paths

The URL or path of a route is often desired for other purposes, e.g. building navigation links of a webpage. (In this example, URLs should **never** be hardcoded.) Rails provides a helper method `link_to`. This method requires text to display, and the path to link.
`link_to 'Edit this post', edit_post_path(3) # Hardcoded only as an example!`

The `edit_post_path(3)` portion here will generate the path `/posts/3/edit`, satisfying the condition that the second argument is a path.

Rails helper methods by definition end with `_path` and `_url`. These suffixes must be used in order to access the Route helper methods. 

To break it down further, `edit_` implies that the route should edit an existing resource, i.e. `get '/posts/:id/edit', to: 'posts#edit'`. The middle portion, `_post_`, refers to the highest level of the resource path. Finally, `_path` indicates that only the path portion is needed. `_url` would generate the full URL. 

Any routes which require a specified ID or other parameter(s) will require those to be supplied to additional helper methods. e.g.:
`post_path(3, :referral_link => '/some/path/to_follow')`

With this example, `:referral_link` will now be available in the `params` hash in the controller. 

An example controller `.rb` file can be viewed in this subdirectory. 

## More RESTful and Non-RESTful Routes

Sometimes, not all seven RESTful routes are necessary. This can be accommodated in the `resources` keyword.

```rb
resources :posts, only: [:index, :show]
resources :users, except: [:destroy]
```

Technically, not everything needs to be RESTful. Sometimes, a custom route mapped to a custom controller action can be developed. So long as this custom route aligns with conventional syntax, it's all right to use.

`get '/somepath', to: 'somecontroller#someaction'`
