# YandexTranslateApi::Yandex

Library for Yandex Translate API

## Installation

Add this line to your application's Gemfile:

    gem 'yandex_translate_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yandex_translate_api

## Usage

First, create translator using your api key:

```ruby
  require 'yandex_translate_api'
  translator = Yandex::Translator.new('your.key')
```

To get list of possible translation directions use #langs method:

```ruby
  translator.langs
  # => {"dirs"=>["pt-en", "en-pt", "be-cs", "be-de", "..."]}

```

To determine language text use detect method:

```ruby
  translator.detect 'Hello, world!'
  # => {"code"=>200, "lang"=>"en"}
```
To translate text use translate method:

```ruby
  translator.translate 'Car', 'pt'
  # => {"code"=>200, "lang"=>"en-pt", "text"=>["Carro"]}
```

In this case Yandex automatically detect text language.
If you want to set text language manually add third parameter

```ruby
  translator.translate 'Car', 'en-pt'
  # => {"code"=>200, "lang"=>"en-pt", "text"=>["Carro"]}

```

## Contributing

1. Fork it (https://github.com/rcostabispo/yandex_translate_api/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request