# Lecture

* rails new
* What is a gemfile
* rake
* databases
* rails server
 * What is a server?
* Create a controller
 * First add a route (match 'home' => "home#get")
 * Then add a controller (class HomeController < ApplicationController)
 * ApplicationController extends ActionController::Base, where controller's
   get their magic
* Lifecycle of a request
 * Client sends a get request with the URL, which gets routed to server
 * Low-level server (WEBBrick, Thin) receives request
 * Looks up what controller/method to call in the config/routes file
 * Creates an instance of the controller
 * Calls that method
 * Method somehow generates content; maybe inline, maybe rendering view
* Views
 * By default, renders a view in the corresponding dir
  * e.g., app/views/home/get
 * Views are typically written in a templating langauge
  * haml or erb
 * Bad practice to mix controller code with view
* DB/Migrations
 * We haven't stored any data anywhere yet
 * Data goes into a database (the SQL part)
 * migrations change structure of DB
 * rails generate migration create_greetings_table
 * Inside is a change method
 * rake db:migrate runs pending migrations
* Models
 * To get at the data in the DB, we use an ORM (ActiveRecord)
 * Create a model class: (class Greeting < ActiveRecord::Base)
 * can experiment in rails console (rails c)
* MVC
 * Let's get our model-view-controller to work together
 * Controller will pull some data out of model
 * Controller will set some instance variables
 * Controller will tell a view to render; the view can use the instance vars
