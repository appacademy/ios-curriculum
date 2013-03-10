# Notes on APIs

## Client and Server, Request and Response

A user interacts with a _client_ (a web browser, command-line utility, iPhone
app, etc). As the user clicks links or performs actions, the client will talk
to a _server_ over the internet. The client will issue a _request_ to the
server, and the server will return a _response_.

For example, each time you type a URL in the top bar of a web browser, or
click on a link, your web browser sends a request to a web server, which
responds with some HTML code.

## HTTP

There are several _protocols_, or systems, by which clients and servers
communicate. We'll talk about [HTTP](http://en.wikipedia.org/wiki/HTTP),
which is what the web is built on top of.

Each client HTTP request specifies a _verb_ or _method_. HTTP defines a small
set of methods, each with a conventional meaning. Here are the most important:

* GET: requests information from the server; this is the usual request type
  when retrieving a web page.
* POST: submit data to the server for processing; this is the usual request
  type when sending a completed web form.
* DELETE: request that the server delete some information.

A typical example:

* A request to "GET" "http://my-yelp-clone.com/restaurants/1234" might
  retrieve a web page for a restaurant with id 1234 in the server's database
* A request to "POST" to "http://my-yelp-clone.com/reviews/" might contain a
  restaurant review and cause the server to save the review to its database.
* A request to "DELETE" "http://my-yelp-clone.com/reviews/6464" might delete
  the review with id 6464 from the server database

It is up to the programmer writing the web app to write code that responds to
these web requests appropriately. For instance, we could write the
my-yelp-clone web app to handle "GET
http://my-yelp-clone.com/restaurants/1234" by deleting a review. This would be
unexpected and confusing, but possible. When writing a web application that
responds to HTTP requests, you should follow convention and do the expected
thing.

## Parts of an HTTP Request

We have discussed HTTP verbs briefly. There are several other parts of an HTTP
request. First, let's talk about URIs.

### URI

A URI contains two major pieces of information: a _host_ and a _path_. Let's
take http://www.reddit.com/r/AppAcademy/ for example. The _host_ is
"www.reddit.com", which specifies what server to talk to; here we specify
Reddit's server, not Digg's. The second important part is the _path_, which is
"/r/AppAcademy". Once our request arrives at Reddit, it wants to know what
subreddit to show. To do this, it interprets the path and recognizes that we
are requesting the AppAcademy Reddit.

In addition to the host and path, a URI may also contain a _query\_string_.
Take, for example:
http://www.reddit.com/r/AppAcademy/search?q=rails&restrict_sr=on&sort=relevance.

The path ends at the "?", what follows is the query string. The query string
consists of a sequence of key-value pairs, like what you find in a ruby hash.
The pairs are formatted in [URL
encoding](http://en.wikipedia.org/wiki/Url_encoding).  URL encoding follows the format:

    key1=value1&key2=value2&key3=value3

Examining this URI, the host is still "www.reddit.com", the path is
"/r/AppAcademy/search", and the query string is
"q=rails&restrict_sr=on&sort=relevance". The "?" simply separates the query
string from path. Breaking the query string further into key-value pairs, we
have:

    q = rails
    restrict_sr = on
    sort = relevance

This means the query is "rails", we would like to restrict the search to this
subreddit, and to sort on relevance.

The query string is used to pass additional parameters or options to the
server. How the key-value pairs are used depends on the web application and
the path requested.

The last part of a URI is the _scheme_, which is either HTTP or HTTPS. The
main difference is that HTTPS communication is encrypted to prevent snooping
of internet traffic (see [Firesheep](http://en.wikipedia.org/wiki/Firesheep)).
It is not important yet to understand how to set up HTTPS connections.

### Request Body

A POST or PUT request may also contain a _body_, also sometimes called a
_payload_. This body contains data to send the server. For instance, a POST to
http://www.my-fake-yelp.com/reviews might submit a new review. The body of
this POST request should contain the restaurant review. It is typical that the
body is a URL encoded hash, though other formats can be specified.

When the web app server receives the request, it will pull the hash out of the
body, deserialize (or unencode) the body, parse the unencoded body, and
perform the requested operation with the data.

Let's step through this process. First, the user might fill out a web form
describing a restaurant review; alternatively, they might fill out a form in
the command line, or in an iPhone app. The web browser/command line
client/iPhone app converts this to a hash:

    { :review => {
	    :reviewer => "Ned Ruggeri",
        :restaurant => "Chez Sophie",
        :review => "I love this restaurant"
	  }
	}

Next it URL encodes the hash:

     reviewer=Ned+Ruggeri&restaurant=Chez+Sophie&review=I+love+this+restaurant

Next, it makes an HTTP request, pasting the URL encoded review in the body:

    POST /reviews
	Host: my-fake-yelp.com
	Content-Type: application/x-www-form-urlencoded
	
    reviewer=Ned+Ruggeri&restaurant=Chez+Sophie&review=I+love+this+restaurant

This is what the HTTP request looks like, but we will just use tools like
RestClient to build requests for us. The important thing to see here is that
the body is separate from the path or host.

The server will finally receive our request, and convert the body back into a
hash. The web app can then decide how to use the body. In our example, it will
create a new review entry with the specified data.

### Headers

HTTP lets you send some special, additional information outside of query
strings or request bodies. There are many different headers; some examples are
the content-type of the body (usually "application/x-www-form-urlencoded"), or
a user name and password for simple HTTP authentication. Most times you won't
need to set a header, but they are sometimes necessary; we can discuss them as
you encounter them.

## Building URIs

It is a pain to construct URIs by hand. Luckily, a ruby gem/library
[addressable/uri](https://github.com/sporkmonger/addressable/tree/) will do
most all of the work for you.  For example:

    require 'addressable/uri'
    review_uri = Addressable::URI.new({
      :scheme => "http",
      :host => "www.my-fake-yelp",
      :path => "/reviews",
      :query_values => {
        :restaurant_id => 6464
      }
    })

creates a Addressable:URI object.  If we call review_uri.to\_s, ruby returns:

    "http://www.my-fake-yelp/reviews?restaurant_id=6464"

Using Addressable::URI this way lets us name the scheme/host/path one-by-one.
We can also pass a nested hash of query_values, which maps each query-string
key to its value.

A quick note. The "Addressable" part of "Addressable::URI" is a
[module](http://ruby-doc.org/docs/ProgrammingRuby/html/tut_modules.html). The
"URI" part is a class defined in the Addressable module. The point of the
Addressable module is to _namespace_ URI, which keeps it from conflicting from
other potential definitions of a URI class.

You will typically need to call .to\_s on your Addressable::URIs, since other
libraries typically expect string representations of URI.

## Making requests

We use the [RestClient](https://github.com/archiloque/rest-client) library to
make HTTP requests. For instance:

    require 'rest-client'
    RestClient.get("http://www.hashmaplabs.com")

will issue a GET request for http://www.hashmaplabs.com. Often, we use
Addressable::URI along with RestClient:

    RestClient.get(Addressable::URI.new({
	  :scheme => "http",
	  :host => "www.reddit.com",
	  :path => "/search.json",
	  :query_values => {
	    :q => "lasers",
	  }
    }).to_s)

Note that I have to call .to\_s on the Addressable:URI object before using it;
RestClient doesn't know anything about the Addressable::URI class, and just
wants a string representation of the URI.

We can also submit post requests with RestClient:

    RestClient.post(Addressable::URI.new({
      :scheme => "http",
      :host => "my-fake-yelp.com",
      :path => "/reviews.json"
    }).to_s, {
      :review => {
        :reviewer => "Ned Ruggeri"
        :review => "My favorite restaurant!"
        :restaurant_id => 6464
      }
    })

Here the first argument is the URI to POST to. The second argument is the hash
to use in the body/payload. By default, if you pass a hash as the payload,
RestClient will take care of serializing it to the URL encoded format.

Delete works likewise

    # payoff received, destroy unfavorable review
    RestClient.delete(Addressable::URI.new({
      :scheme => "http",
      :host => "my-fake-yelp.com",
      :path => "/reviews/9753"
    })

### Passing headers to RestClient

You may occasionally be required to pass special headers. You can do this by
specifying an additional options hash to any of the RestClient methods. For
instance:

    RestClient.post(Addressable::URI.new({
      :scheme => "http",
      :host => "my-fake-yelp.com",
      :path => "/reviews.json"
    }).to_s, JSON.generate({
      # send a JSON formatted body, instead of URL encoded
      :review => {
        :reviewer => "Ned Ruggeri"
        :review => "My favorite restaurant!"
        :restaurant_id => 6464
      }
    }), {
      # this is my options hash
      # tell server the body is formatted in JSON
      :content_type => "application/json"
    })
