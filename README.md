# Trie::Viz

[![Build Status](https://cloud.drone.io/api/badges/sbezugliy/trie-viz/status.svg)](https://cloud.drone.io/sbezugliy/trie-viz)

[![codecov](https://codecov.io/gh/sbezugliy/trie-viz/branch/master/graph/badge.svg)](https://codecov.io/gh/sbezugliy/trie-viz)

Running website: https://trie-viz.herokuapp.com

## Installation

Install graphviz:

```shell
# Debian, Ubuntu, etc...
$ sudo apt-get install graphviz

# Arch
sudo pacman -S graphviz

# RedHat, etc...
$ sudo yum install graphviz
```

Add this line to your application's Gemfile:

```ruby
gem 'trie-viz'
```

And then execute:

```shell
$ bundle
```
Or install it yourself as:
```shell
$ gem install trie-viz
```


## Run tests
Foreground mode:

```shell
$ GUI=true rspec
```

Background:

```shell
$ rspec
```

## Run server

```shell
$ bundle exec./bin / server
```

Open http://localhost:4567/ in your browser

## Development

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sbezugliy/trie-viz.
