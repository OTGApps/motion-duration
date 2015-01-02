# motion-duration

[![Build Status](https://travis-ci.org/OTGApps/motion-duration.svg)](https://travis-ci.org/OTGApps/motion-duration)

Motion::Duration is an immutable type that represents some amount of time with accuracy in seconds.

It was adapted for RubyMotion from [ruby-duration](https://github.com/peleteiro/ruby-duration) by Jose Peleteiro since it required ActiveRecord, iso8601, and i18n.

This version currently lacks i18n, iso8601, and formatting support.

## Installation

Add this line to your application's Gemfile:

    gem 'motion-duration'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-duration

## Usage

```ruby
Duration.new(100) => #<Duration: minutes=1, seconds=40, total=100>
Duration.new(:hours => 5, :minutes => 70) => #<Duration: hours=6, minutes=10, total=22200>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Original License

Copyright (c) 2010 Jose Peleteiro

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
