## Challenges

#### As a user, I can visit a landing page at localhost:3000 that has links to other pages named:

```Shell
$ rails new random_things_app -d postgresql -T
$ cd random_things_app
$ rails db:create
  # Created database 'random_things_app_development'
  # Created database 'random_things_app_test'
$ rails g controller Main
  # create  app/controllers/main_controller.rb
  # invoke  erb
  # create    app/views/main
  # invoke  helper
  # create    app/helpers/main_helper.rb
  # invoke  assets
  # invoke    scss
  # create      app/assets/stylesheets/main.scss
```

- cubed
- evenly
- palindrome
- madlib

```Ruby
class MainController < ApplicationController
  def cubed
    render 'cubed.html.erb'
  end
  def evenly
    render 'evenly.html.erb'
  end
  def palindrome
    render 'palindrome.html.erb'
  end
  def madlib
    render 'madlib.html.erb'
  end
end
```

```Ruby
Rails.application.routes.draw do
  get '/cubed' => 'main#cubed'
  get '/evenly' => 'main#evenly'
  get '/palindrome' => 'main#palindrome'
  get '/madlib' => 'main#madlib'
end
```

#### As a user, I can visit a page called cubed that takes a number as a param and displays that number cubed.

```Ruby
def cubed
  @cubed_number = params[:cubed]
  render 'cubed.html.erb'
end
```

```Ruby
<h1>Your Param will be cubed!</h1>
<h2><%= @cubed_number %><sup>3</sup> = <%= @cubed_number.to_i ** 3 %><h2>
```

#### As a user, I can visit a page called evenly that takes two numbers and displays whether or not the first number is evenly divisible by the second.

```Ruby
def evenly
  @first_num = params[:first_num]
  @second_num = params[:second_num]
  @result =
    if @first_num.to_i % @second_num.to_i == 0
      'is evenly divisible by'
    else
      'is not evenly divisible by'
    end
end
```

```Ruby
<h1>Is your number evenly divisble by your other number?</h1>
<h2><%= @first_num%>
<%= @result%>
<%= @second_num%></h2>
```

#### As a user, I can visit a page called palindrome that takes a string and displays whether it is a palindrome (the same word read forward and backward).

```Ruby
def palindrome
  @word = params[:word]
  @result =
    if @word.downcase == @word.downcase.reverse
      ' is a palindrome!'
    else
      ' is not a palindrome...'
    end
end
```

```Ruby
<h1>Hello, world! palindrome</h1>
<h2><%= @word%><%= @result%></h2>
```

#### As a user, I can visit a page called madlib that takes params of a noun, verb, adjective, adverb, and displays a short silly story.

```Ruby
def madlib
  noun = params[:noun]
  verb = params[:verb]
  adjective = params[:adjective]
  adverb = params[:adverb]
  @result = "The #{adjective} #{noun} was #{verb} very #{adverb}!"
end
```

```Ruby
<h1>Here is your madlib!</h1>
<h2><%= @result%></h2>
```

```Ruby
Rails.application.routes.draw do
  root 'main#home_page'
  get '/cubed/:cubed' => 'main#cubed'
  get '/evenly/:first_num/:second_num' => 'main#evenly'
  get '/palindrome/:word' => 'main#palindrome'
  get '/madlib/:noun/:verb/:adjective/:adverb' => 'main#madlib'
end
```

```Ruby
# home_page.html.erb
<h1>Welcome to our Random Things App</h1>
<h2>Click the link to see an example and use the URL to create your own!</h2>
<ul>
  <li><%= link_to 'Cube your number','/cubed/3'%></li>
  <li><%= link_to 'Check if your number is evenly divisible by another number','/evenly/10/2'%></li>
  <li><%= link_to 'See if your word is a palindrome or not','/palindrome/hannah'%></li>
  <li><%= link_to 'Give a noun, verb, adjective, and adverb to create a simple madlib','/madlib/cat/running/humongous/patiently'%></li>
</ul>
```
