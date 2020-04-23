# Hanami Api

Welcome to your new Hanami project!

## Setup

How to run tests:

```
% bundle exec rspec
```

How to run the development console:

```
% bundle exec hanami console
```

How to run the development server:

```
% bundle exec hanami server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% bundle exec hanami db prepare && HANAMI_ENV=test bundle exec hanami db prepare
```

How to generate Actions

```
% bundle exec hanami generate action api users#index --skip-view

% bundle exec hanami generate action api users#show --skip-view

% bundle exec hanami generate action api users#create --method=post --skip-view

% bundle exec hanami generate action api users#update --method=patch --skip-view

% bundle exec hanami generate action api users#destroy --method=delete --skip-view

```

How to generate Model

```
% bundle exec hanami generate model user
```

Explore Hanami [guides](https://guides.hanamirb.org/), [API docs](http://docs.hanamirb.org/1.3.3/), or jump in [chat](http://chat.hanamirb.org) for help. Enjoy! 🌸
