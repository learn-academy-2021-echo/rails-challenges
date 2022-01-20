class FunctionMatesController < ApplicationController
  def cubed
      # @number = params[:somenumber]
      @number = params[:somenumber].to_i * params[:somenumber].to_i * params[:somenumber].to_i

      render 'cubed.html.erb'
  end

  def evenly
      if params[:number1].to_i % params[:number2].to_i == 0
        @result_string = "evenly divisible"
      else
        @result_string = "not evenly divisible"
      end
      render 'evenly.html.erb'
  end

  def palindrome
      if params[:string] == params[:string].reverse
        @result_string = "String is a palindrome"
      else
        @result_string = "String is not a palindrome"
   end
      render 'palindrome.html.erb'
  end

  def madlib
      @noun = params[:noun]
      @verb = params[:verb]
      @adjective = params[:adjective]
      @adverb = params[:adverb]
      render 'madlib.html.erb'
  end
end
# cubed
# evenly
# palindrome
# madlib
