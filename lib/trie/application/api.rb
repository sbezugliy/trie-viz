# frozen_string_literal: true

require 'sinatra' 

##
# Web application starter class
class Api < Sinatra::Base
  get '/api', provides: :html do
  end
end
