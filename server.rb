require 'sinatra'
require 'pry'
require "sinatra/reloader" if development?

enable(:sesions)

require_relative('./lib/sinatra.rb')
require_relative('./lib/task.rb')
list  = TodoList.new("Pedrito")

get "/" do
	@my_list = list
	erb :inicio
end

post "/add_item" do
	@my_list = list
	@my_list.add_item_list(params[:task])
	erb :inicio
end

post "/delete_item" do
	@my_list = list
	@my_list.delete_task_by_id(params[:id].to_i)
	erb :inicio
end

post "/complete_task" do
	@my_list = list
	@my_list.complete_task(params[:id].to_i)
	erb :inicio
end

post "/change_task" do
	@my_list = list
	@my_list.change_state_task(params[:id].to_i)
	erb :inicio
end

post "/change_content" do
	@my_list = list
	@my_list.change_task_content_of_list(params[:id].to_i, params[:content])
	erb :inicio
end

post "/sort_A" do
	@my_list = list
	@my_list.sort_by_created("A")
	erb :inicio
end

post "/sort_B" do
	@my_list = list
	@my_list.sort_by_created("D")
	erb :inicio
end

post "/save" do
	@my_list = list
	@my_list.save_task_list
	erb :inicio
end