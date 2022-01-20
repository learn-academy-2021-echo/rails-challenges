$ rails new math_lab -d postgresql -T
$ cd math_lab
$ rails db:create
>>Running via Spring preloader in process 20010
>>Created database 'math_lab_development'
>>Created database 'math_lab_test'
>>learnacademy@learns-air math_lab % 
$ rails g controller MathFunctions
$ rails s

/math_lab/app/controllers/concerns/math_functions_controller.rb
`class MathFunctionsController < ApplicationController
    def cubed 
        @number = params[:number].to_i
        @result_cube = @number ** 3
        render 'cubed.html.erb'
    end
    def even
        if params[:number1] != nil
            @number1 = params[:number1].to_i
        else
            @number1 = 1
        end
        if params[:number2] != nil
            @number2 = params[:number2].to_i
        else
            @number2 = 1
        end
       # if @number1 != nil && @number != nil
        if @number1 % @number2 == 0
            @result = "#{@number1} is evenly divisible by #{@number2}."
        else
            @result = "#{@number1} is not evenly divisible by #{@number2}."
        end
        render 'even.html.erb'
        #else
        #ender html: 'Cubed Test'
        #end
    end
    def palindrome
        @string = params[:string]
        if @string.downcase.reverse == @string.downcase
            @pally_result = "#{@string} is a palindrome."
        else
            @pally_result = "#{@string} is not a palindrome."
        end
        render 'palindrome.html.erb'
    end
    def mad_lib
        @noun = params[:noun]
        @verb = params[:verb]
        @adjective = params[:adjective]
        @adverb = params[:adverb]
        @sentence = "The #{@noun} went to #{@adverb} #{@verb} in a #{@adjective} way."
        render 'mad_lib.html.erb'
    end
    def home
        render 'home_page.html.erb'
    end
end`

math_lab/app/views/math_functions/cubed.html.erb
`<h1>Cubed Test</h1>
<h3><%= @result_cube %></h3>
<h4> <%= link_to 'Homepage', '/' %> </h4>`

math_lab/app/views/math_functions/even.html.erb
`<h1>Even Test</h1>
<%= @result %>
<h4> <%= link_to 'Homepage', '/' %> </h4>`

math_lab/app/views/math_functions/palindrome.html.erb
`<h1>Palindrome Test</h1>
<%= @pally_result %>
<h4> <%= link_to 'Homepage', '/' %> </h4>`

math_lab/app/views/math_functions/mad_lib.html.erb
`<h1>Mad Lib Test</h1>
<%= @sentence %>
<h4> <%= link_to 'Homepage', '/' %> </h4>`

math_lab/app/views/math_functions/home_page.html.erb
`<h1>In the homepage</h1>
<ul>
<li> <%= link_to 'Cube Method', '/cubed/3' %> </li>
<li> <%= link_to 'Even Method', '/even/6/3' %> </li>
<li> <%= link_to 'Palindrome Method', '/palindrome/Refer' %> </li>
<li> <%= link_to 'Mad Lib Method', '/madlib/Salvador/buy milk/expedient/quickly' %> </li>
</ul>`

math_lab/config/routes.rb
`Rails.application.routes.draw do
  get '/cubed/:number' => 'math_functions#cubed'
  get '/cubed' => 'math_functions#cubed'
  get '/even/:number1/:number2' => 'math_functions#even'
  get '/even' => 'math_functions#even'
  get '/palindrome/:string' => 'math_functions#palindrome'
  get '/palindrome' => 'math_functions#palindrome'
  get '/madlib/:noun/:verb/:adjective/:adverb' => 'math_functions#mad_lib'
  get '/madlib' => 'math_functions#mad_lib'
  root 'math_functions#home'
end`
