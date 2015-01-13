# rails-session_jsonizer

rails-session_jsonizer is a simple library for Rails 3 and 4 to
serialize session into JSON in the same format.

*Work in progress*

[![Build Status](https://travis-ci.org/pixta-dev/rails-session_jsonizer.svg?branch=master)](https://travis-ci.org/pixta-dev/rails-session_jsonizer)

## Requirement

* Rails 3.1 or later

## Usage

### In controller

```ruby
session[:foo] = 'bar'
flash[:alert] = 'something went wrong'
```

### Serialize

```ruby
require 'session_jsonizer'

# dump
serializer = SessionJsonizer.new

json = serializer.dump(session)

json # => '{"foo":"bar", "flash":{"alert":"something went wrong"}, ...}'

# load
session = serializer.load(json)
```

### Example: Store session into memcached as JSON using [dalli](https://github.com/mperham/dalli)

```ruby
# config/initializers/session_store.rb

require 'action_dispatch/middleware/session/dalli_store'
Rails.application.config.session_store :dalli_store, serializer: SessionJsonizer.new, ...
```
