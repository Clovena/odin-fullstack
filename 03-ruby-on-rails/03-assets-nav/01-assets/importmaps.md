# Importmaps

Importmaps allows for importing of js modules using logical names that map to versioned/digested files, directly from the browser. Sure. 

With this approach, many small js files, rather than one big js file, get shipped. This offers substantial benefits due to HTTP/2. 

Importmaps is not a Rails-specific tool, just one that Rails development opted for as the default common-sense way to ship js. The basic premise is that js libraries can be loaded into an app using their name, rather than an exact location. e.g. `import React from "react"`

Location-based specifiers might look like:
- absolute path `import React from "/Users/Odin/projects/TOP/node_modules/react"`
- relative path `import React from "./node_modules/react"`
- http path `import React from "https://ga.jspm.io/npm:react@18.2.0/index.js"`

The `importmap-rails` gem provides an API for mapping the so-called "bare module specifiers" (`import React from "react"`) to one of those three paths.

```rb
# config/importmap.rb
pin "react", to: "https://ga.jspm.io/npm:react@18.2.0/index.js"`
```

The `importmap-rails` gem is now automatically included to a Gemfile in Rails 7 or above. This gem: 
- adds `<%= javascript_importmap_tags %>` to `views/layouts/application.html.erb`
  - This sets up the json configuration inside of a `<script type="importmap">` tag
- loads `es-module-shim`
- imports the app entry point via `<script type="module">import "application"</script>`