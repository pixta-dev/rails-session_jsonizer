# rails-session_jsonizer

rails-session_jsonizer is a simple library for Rails 3 and 4 to
serialize session into JSON in the same format.

*Work in progress*

[![Build Status](https://travis-ci.org/pixta-dev/rails-session_jsonizer.svg?branch=master)](https://travis-ci.org/pixta-dev/rails-session_jsonizer)

## Requirement

* Rails 3 or 4

## Usage

```ruby
require 'session_jsonizer'

session[:foo] = 'bar'
flash[:alert] = 'something went wrong'

# dump
json = SessionJsonizer.dump(session)

json # => '{"foo":"bar", "flash":{"alert":"something went wrong"}, ...}'

# load
session = SessionJsonizer.load(json)
```
