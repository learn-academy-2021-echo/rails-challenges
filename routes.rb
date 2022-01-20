Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/cubed_path/:somenumber' => 'function_mates#cubed'
  get '/evenly_path/:number1/:number2' => 'function_mates#evenly'
  get '/palindrome_path/:string' => 'function_mates#palindrome'
  get '/madlib_path/:noun/:verb/:adjective/:adverb' => 'function_mates#madlib'
  root 'function_mates#homepage'
end
