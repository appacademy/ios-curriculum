# Introduction to APIs

## Demo:

* IntroToAPIs

## Tomorrow's project:

* http://ruby.bastardsbook.com/chapters/intro_tweet_fetch

## Lecture:

* First, may need to fix certificates
 * sudo port install curl-ca-bundle; gem cert -a /opt/local/share/curl/curl-ca-bundle.crt
* An API ("Application programming interface") lets you make
  "requests" or "queries" to a server and get structured data back
 * What you get back is called the _response_
 * A server is another computer sitting somewhere else; waiting to respond to incoming
   request from client machines
 * There are two main HTTP "verbs": GET and POST
  * The verbs are about intent; they aren't particularly different
  * Conventionally, GET requests request data without updating the server
  * Conventionally, POST requests update data on the server
* Anatomy of a web request:
 * scheme: http or https
  * https means _secure_ (encrypted), which you want to use if you're sending passwords
 * host: maps.googleapis.com
  * this name identifies which service you're talking to
 * path: /maps/api/place/search/json
  * now that you're talking to the right service, you need to tell it what
    kind of action to do
  * Different actions have different paths; this path is for places search on google
  * Here's another path for streetview: maps/api/streetview
 * query string: ?key=AIzaSyBFiv8ziB9Z6_0v6e0CO7BHzzxE2hVyUj8&keyword=xyz
  * Structured into key-value pairs
  * k1=v1&k2=v2
  * apis will specify parameters
  * often need an api key that you need to sign up for
* Libraries ('gems')
 * Pieces of code written by other people that you can use
 * Load them with: require 'gem_name'
* Rest-client
 * RestClient.get(url): get a page without any params
 * RestClient.get(url, { :params => { :key1 => :val1, :key2 => :val2 }}): get
   a page with params
 * RestClient.post(url, { :params => { :key1 => :val1, :key2 => :val2 }}):
   send params up to the server
* Response format
 * Often is XML or JSON
 * JSON and XML are for data "serialization"
 * Like a hash, but you can save it to a file
 * Objects live inside a single ruby program, but to save them
	need to convert to an interpretable format
 * to convert between xml and ruby, use 'crack' gem
 * To convert between json and back, use 'json' gem

## More APIs:

* https://developers.google.com/places/documentation/
* https://developers.google.com/maps/
* http://www.flickr.com/services/api/
* https://dev.twitter.com/docs
* http://www.bing.com/toolbox/bingdeveloper/

## More projects:

* Write a program to get text directions to/from locations
* Write a program that manages a twitter account; I tweet at it with a request, it
  tweets back at me
* Write a command line twitter client (JSTwitter?)
 * Write a spec from the JSTwitter
* Find an API yourself, do something cool with it
