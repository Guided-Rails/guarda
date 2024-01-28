# Guarda

Is another authorization gem that was heavily inspired by [Pundit](https://rubygems.org/gems/pundit).

It assumes you are using [Current Attributes](https://api.rubyonrails.org/classes/ActiveSupport/CurrentAttributes.html) to get your currently authenticated user.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add guarda
```

Include `Guarda::Authorization` in your application controller:

```ruby
class ApplicationController < ActionController::Base
  include Guarda::Authorization
end
```

## Usage

In the controller:

```ruby
class PostsController < ApplicationController
  def index
    authorize
  end

  def update
    authorize @post
  end
end
```

In the view:

```erb
<% if policy("posts").index? %>
  <%= link_to "Posts", "#" %>
<% end %>

<% if policy("posts", @post).update? %>
  <%= link_to "Edit Post", "#" %>
<% end %>
```

With this policy class `app/policies/posts_policy.rb`:

```ruby
class PostsPolicy
  def initialize(post = nil)
    @post = post
  end

  def index?
    Current.person.admin?
  end

  def update?
    @post.author == Current.person
  end
end
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
