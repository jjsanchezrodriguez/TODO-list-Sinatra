require 'sinatra'
require 'pry'
require "sinatra/reloader" if development?

enable(:sesions)

require_relative('./lib/sinatra.rb')
require_relative('./lib/task.rb')

get "/" do
	erb :inicio
end