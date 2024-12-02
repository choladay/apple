# Approach

### Implementation Plan:

1. Create a form that take in a text field for the address and forwards to a page that puts the address as a GET param.
1. Translate the given address into a zip code.  Look into what libraries or APIs are available to do this.
1. Fetch weather data from a weather source, probably via REST API.
1. Cache results for 30 minutes with cache hit/miss indicator, per spec.


### Out of scope:

Here are things I am explicitly not going to implement.  In a real business environment I would either add onto our current implementation (e.g. Auth) or create follow-up tickets to handle those cases (e.g. Timeouts).

- Records of request history
- Logging
- Timeout handling
- Authentication
- Responsive Web Design
- Anti-abuse
- Cache-busting
- API Key storage protection
- Non-US address handling

# Setup (OSX)

This being a Rails 7.2 repo, you must have ruby >= `3.1` installed

Bundle install

```
bundle install
```

Turn on caching in development

```
bundle exec rails dev:cache
```

Add API keys to `.env`

Start the server

```
bin/rails server
```

Then use the form!

```
http://localhost:3000
```

Run tests

```
bundle exec rspec
```
