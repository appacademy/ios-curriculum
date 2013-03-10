# OAuth 2.0

OAuth 2.0 is a standard way to authorize a _client_ application (like a web or
iPhone app) to interact with a _service_ like Github or Instagram and act on
behalf of a _user_. The user authorizes the client within certain _scopes_;
the app can request permission just to view the Twitter timeline, or it may
request permission to post.

There are two key points to OAuth 2.0. The user never gives his service
username/password to the client, and either the user or service can revoke the
client's access at any time.

# OAuth setup

You will need to go to Github or Instagram and create a new application or
client. This will assign you a client id and key. You need these to establish
your app's identity when authorizing new users and making requests.

You will need to specify a redirect URL, which is where the user is redirected
after they grant your app permissions. For simplicity, set this to
http://localhost. Your client will be redirected to an empty website, but you
can manually extract the confirmation code from the query string.

# OAuth flow

Say we are building a client called HashMapGithubFetcher. It will need the
user to authorize HashMapGithubFetcher to fetch repo information from Github.

To begin the authorization, HashMapGithubFetcher redirects the user to a
github url. Here the user logs in and confirms giving HashMapGithubFetcher
permissions to read his repos. When done, Github redirects the user back to
the HashMapGithubFetcher website.

Inside the query string of the redirect is a temporary code that
HashMapGithubFetcher can send to Github to get a permanent authorization
token. From then on, whenever HashMapGithubFetcher makes API requests on the
user's behalf, it must also send along this authorization token.

# Examples

I've included some oauth2 examples for both the Github and Instagram APIs.