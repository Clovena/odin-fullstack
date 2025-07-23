# Controllers

Controllers are responsible for handling HTTP requests assigned to them by the router.

When a router assigns a request to a controller, Rails obtains all parameters associated with the request and runs the specified method in the specified controller.

Controllers are typically lightweight and accomplish much with little code.

```rb
PostsController < ApplicationController
  def index
    @posts = Post.all
  end
end
```

Here, if we want to show all blog posts in a site's index page, simply run the `#index` action of the Posts controller. It will grab all posts and send them to a hypothetical `index.html.erb` file.

## Naming Conventions

Rails assumes things are named a certain way and executes them based on those names. Therefore, these conventions should be followed in order for Rails to run properly.

For instance, a controller and its action must be named based on what they're called in `routes.rb` when a specific type of HTTP request was mapped to them.

Once Rails reaches the `end` of a controller action, it collects all the instance variables from the controller and sends them to the view file. This view file:

- is named the same thing as the controller action, and
- lives in a folder named after the controller.

For example: `app/views/posts/index.html.erb`

## Rendering and Redirecting

Rails implicitly renders a view file which is named after the controller action. However, this can be explicitly overriden as well. One use case for this is when the user might need to be redirected to a completely new page instead of rendering the result of a controller action.

Redirects typically occur after a controller action where new information is submitted, e.g. creating a new Post. Usually, the Post that was just created should be rendered, rather than reverting back to a `create.html.erb` view.

Another instance is if the controller action fails for some reason. If something to be Posted doesn't meet a criteria, it's often useful to render the very same Post that's being created so that the form isn't wiped copmletely clean.

```rb
# app/controllers/posts_controller.rb
class PostsController < Application Controller

  def new
    @post = Post.new
  end
  # This makes, but doesn't save, an empty Post.
  # The form rendered knows which fields to use
  # and where to submit the form.
  # This action will render app/views/posts/new.html.erb
  # once it's done.

  def create
    # this code sets up a new @post based on form info
    if @post.save
      # code to set up success message
      redirect_to post_path(@post.id)
    else
      # code to set up error message
      render :new, status: :unprocessable_entity
    end
  end
  # This will run once the submitted form is received
  # from the NEW action above.
  # Pseudo-code is used above to illustrate.

end
```

Line 56 above can be shorthanded as `redirect_to @post` because this is such a common action.

Importantly, `render` and `redirect_to` do NOT immediately stop your controller action like a `return` statement would. Therefore, code logic must be arranged carefully to ensure that flow is accurate.

Something like:

```rb
def show
  @user = User.find(params[:id])
  if @user.is_male?
    render "show-boy"
  end
  render "show-girl"
end
```

will throw a multiple render error, since `render "show-girl"` will run no matter what.

## Params and Strong Parameters

To collect and access parameters that are sent with HTTP requests, we use the `params` object. This is an instance of `ActionController::Parameters` and it behaves similarly to a normal Ruby hash. It contains the parameters of the request stored as `:key => value` pairs. Any parameters with so-called "scalar values" can be stored in this way, e.g. strings, numbers, booleans, nil, etc. To access an ID, for instance, `params[:id]` would achieve that.

Sometimes, it is desirable to send parameters that are packaged together into a hash or nested in an array. This is compatible with Post.new() because that's what the function expects anyway. 

Rails 4 implemented some protections in the controller, called "Strong Parameters," which require explicit verification of acceptable data via the `#expect` method. This prevents harmful hashes from entering the program. 

```rb
def allowed_post_params
  params.expect(pos: [:title, :body, :author_id])
end
```

This will return the hash of only those params specified in `#expect`. All additional fields will be stripped away and made inaccessible.

Let's revisit the `PostsController` class from before and include explicitly allowed params.

```rb
class PostsController < ApplicationController

  def create
    @post = Post.new(allowed_post_params)
    if @post.save
      # Congrats message
      redirect_to post_path(@post.id)
    else
      # Error message
      render :new, status: :unprocessable_entity
    end
  end

  private # Common practice is to make private any methods involving #expect

  def allowed_post_params
    params.expect(post: [:title, :body, :author_id])
  end

end
```

In older versions of Rails, `#expect` was preceded by the following:

`params.require(:post).permit(:title, :body, :author_id)`

This might stil show up on old documentation, Stack Overflow, etc. 

## Flash

Now to handle those special messages thus far included via pseudocode. Rails provides a built-in tool for sending success and error messages; this is called the flash and acts similarly to a regular hash. It holds three specific keys and can be given any values for those keys (the custom messages). 

```rb
{
  :success => "Great! Your post has been created.",
  :error => "Post not created. Please review and fix the mistakes.",
  :notice => "This is simply a notice."
}
```

The flash automatically erases itself once it's used. Not sure how this actually plays out in practice, but I'm sure we'll see it soon. 

When a redirect occurs, it provides a brand new HTTP request with all data lost. The flash is the exception to this. It is specifically designed to travel with any HTTP redirect so access to it is maintained when the redirect occurs.

When rendering a view, rather than redirecting, there is another flash distinction. `flash.now` must be used, e.g. `flash.now[:error]`. This allows for the message to be displayed at the proper time. If used incorrectly, it will quickly become apparent by the delayed messages. 

Let's revisit the `PostsController` class one last time. 

```rb
class PostsController < ApplicationController

  def create
    @post = Post.new(allowed_post_params)

    if @post.save
      flash[:success]
      redirect_to @post # Remember that this is shorthand for post_path(@post.id)
    else
      flash.now[:error]
      render :new, status: :unprocessable_entity
    end
  end

  private

  def allowed_post_params
    params.expect(post: [:title, :body, :author_id])
  end

end
```

In the end, this action does a fair amount. It grabs form data via `allowed_post_params`, it makes a new post via `Post.new`, it attempts to save the post via `if @post.save`, and handles success and error accordingly. 
