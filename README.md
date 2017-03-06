# shortest-skipper

This library helps you skip shorte.st links programmatically (you still have to wait 5 seconds)

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  shortest-skipper:
    github: denysvitali/shortest-skipper
```

## Usage

```crystal
require "shortest-skipper"

skipped = Shortest::Skipper::Skipper.skip "http://viid.me/qq0BOa"

if skipped.is_a? Shortest::Skipper::Skipper::Result
  puts skipped.destinationUrl
end
```
I know, `Shortest::Skipper::Skipper.skip` isn't beautiful, you can rename it if you want

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/denysvitali/shortest-skipper/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [denysvitali](https://github.com/denysvitali) Denys Vitali - creator, maintainer
