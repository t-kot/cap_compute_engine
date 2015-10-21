# CapComputeEngine

Simple utilities for capistrano for google compute engine.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cap_compute_engine', git: 'https://github.com/t-kot/cap_compute_engine', require: false
```

## Usage


```ruby
# To get all compute engine vm instances
list = CapComputeEngine::InstanceList.get

# To select tagged instances from list
tagged_list = list.with_tag('app-server')

# To get external ips from list
tagged_list.external_ips
# => ['104.155.xxx.xxx', '123.111.xxx.xxx']

# To allow instances to access cloud sql instance
tagged_list.authorize_cloud_sql('cloud-sql-instance-name')

```


### for capistrano (my suggestion)

```ruby
require 'cap_compute_engine'


list = CapComputeEngine::InstanceList.get
list.authorize_cloud_sql('cloud-sql-instance-name')

role :app, list.with_tag('app-server').external_ips
role :web, list.with_tag('web-server').external_ips
role :db, list.with_tag('db-server').external_ips
role :sidekiq, list.with_tag('sidekiq-server').external_ips

```

## TODO

Very rough code so maybe not work for specific environments.
should make `CapComputeEngine::InstanceList.get` to receive arguments such as project name, or should create configure method `CapComputeEngine.configure { |config| ...}`


## Contributing

1. Fork it ( https://github.com/[my-github-username]/cap_compute_engine/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
