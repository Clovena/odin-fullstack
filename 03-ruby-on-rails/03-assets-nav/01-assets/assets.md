# Assets

Assets are additional files in an application that get called by the browser after the initial HTML is loaded. These can be CSS stylesheets, JS files, images, etc. 

Originally, the Asset Pipeline handled all assets. Now, though, JavaScript assets are handled through other JS mgmt tools. For Rails 7, the standard is to handle JS through import maps (forthcoming). In legacy Rails apps, JS may still be handled by the Asset Pipeline. 

## Asset Pipeline

The Asset Pipeline is a function in Rails that gathers all assets, flattens them into one big asset per filetype, and loads them into the app. If an app contains many different css files, for instance, the browser must request each of them individually, slowing down performance. 

## Manifest Files

Manifest files are used to determine which files to include in the pipeline. In legacy JS pipelines, these will live at `app/assets/javascripts/application.js`. For css stylesheets, it's `app/assets/stylesheets/application.css`. 

Consider a Controller `CatController`. Perhaps a corresponding stylesheet is desired. This should be named `cat.css` and saved at `app/assets/stylesheets/cat.css`. 

Manifest files can also live at `lib/assets` and `vendor/assets`. 

The final output - the squashed down file - is given a generated name like `application-1fc71ddbb281c144b2ee4af31cf0e308.js`. This is to keep track of versions and prevent duplicates from being generated.
