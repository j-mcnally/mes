
Alot of the template is based off of 'middleman-ember-template'
with some tweaks in favor of coffee-script and sass.

https://github.com/GutenYe/middleman-ember-template


middleman-ember-template: with Ember.js  
=======================================

**Template Layout**

		.
		├── Capfile
		├── Gemfile
		├── README.md
		├── component.json
		├── components
		│   ├── ember
		│   │   ├── component.json
		│   │   ├── ember.js
		│   │   └── ember.min.js
		│   ├── ember-data
		│   │   ├── README.md
		│   │   ├── component.json
		│   │   ├── ember-data-spade.js
		│   │   ├── ember-data.amd.js
		│   │   ├── ember-data.js
		│   │   ├── ember-data.min.js
		│   │   └── ember-data.prod.js
		│   ├── handlebars
		│   │   ├── component.json
		│   │   ├── handlebars.js
		│   │   └── handlebars.runtime.js
		│   └── jquery
		│       ├── component.json
		│       ├── composer.json
		│       ├── jquery-migrate.js
		│       ├── jquery-migrate.min.js
		│       ├── jquery.js
		│       └── jquery.min.js
		├── config
		│   └── deploy.rb
		├── config.rb
		├── source
		│   ├── app
		│   │   ├── application.coffee
		│   │   ├── controllers
		│   │   │   ├── application_controller.coffee
		│   │   │   └── index_controller.coffee
		│   │   ├── main.coffee
		│   │   ├── models
		│   │   │   └── foo.coffee
		│   │   ├── routes.coffee
		│   │   └── views
		│   │       ├── application_view.coffee
		│   │       └── index_view.coffee
		│   ├── images
		│   ├── index.html.haml
		│   ├── layout.haml
		│   ├── stylesheets
		│   │   ├── application.css.scss
		│   │   └── variables.scss
		│   ├── swf
		│   └── templates_emblem
		│       ├── application
		│       │   └── index.emblem
		│       └── application.emblem
		├── vendor
		│   ├── javascripts
		│   │   ├── bootstrap-dropdown.js
		│   │   ├── bootstrap-modal.js
		│   │   ├── bootstrap-modalmanager.js
		│   │   ├── bootstrap-popover.js
		│   │   ├── bootstrap-tabs.js
		│   │   ├── bootstrap-tooltip.js
		│   │   ├── date.js
		│   │   ├── ember-data.js -> ../../components/ember-data/ember-data.js
		│   │   ├── ember.js -> ../../components/ember/ember.js
		│   │   ├── handlebars.js -> ../../components/handlebars/handlebars.js
		│   │   ├── jquery.js -> ../../components/jquery/jquery.js
		│   │   ├── jquery.validate.min.js
		│   │   ├── json2.js
		│   │   ├── underscore.js
		│   │   └── utils.js
		│   └── stylesheets
		└── watch

You may also want to checkout the [Ember.js with Middleman example](https://github.com/GutenYe/example-ember-with-middleman).

Usage
-----

1. Download and install into ~/.middleman/ember (you'll need to create the directory it doesn't already exist)

2.  Initialize a new middleman project with `middleman init my_project --template=ember`

You can read more about project templates on the [Middleman site](http://middlemanapp.com/getting-started/welcome/).
