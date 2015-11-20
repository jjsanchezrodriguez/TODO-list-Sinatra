require_relative "task.rb"
require 'yaml/store'
require "pry"

class TodoList
	attr_reader :task_list, :user, :todo_store
 	def initialize(user)
 		@task_list = task_list
 		@user = user
 		@todo_store = YAML::Store.new("./public/tasks.yml")
 		@task_list =[Task.new("Comprar Patatas"), Task.new("Ir a la tintoreria")]

 	end

 	def add_item_list(content)
 		@task_list << Task.new(content) 

 	end

 	def choose_task_list_by_id
 		show_task_list
 		puts "Please select a task!!!"
 		id = gets.chomp
 		id.to_i
 	end

 	def show_task_list     
 		@task_list.each { |task| 
 		puts "Id: #{task.id} Tarea: #{task.content} Fecha: #{task.created_at.strftime("%x")} Estado: #{task.complete} Modificado: #{task.update_content}"}  
	 end

 	def delete_task_by_id(id)
 		if is_empty? == false
	 		@task_list.delete_if { 	|task| task.id == id}
	 	else
	 		puts "There isn't tasks...."
	 	end
 	end

 	def is_empty?
 		empty = false
 		if @task_list == []
 			empty = true
 		end
 		empty
 	end

 	def change_state_task(id)
 		pos = find_task_by_id(id)
		@task_list[pos].make_incomplete!
 	end

 	def complete_task(id)
 		pos = find_task_by_id(id)
		@task_list[pos].complete!
 	end

 	def find_task_by_id(id)
 		@task_list.find_index { |task| task.id == id }
 	end

 	def show_task_in_list(pos)
 		if pos == nil
 			return nil
 		else	
 			@task_list[pos].content
 		end	
 	end

 	# Sin sinatra asi funcionaba con los test y por consola
 	# def change_task_content_of_list(id)
 	# 	pos = find_task_by_id(id)
 	# 	puts show_task_in_list(pos)
 	# 	puts "Please intro new content"
 	# 	@task_list[pos].change_update_content(gets.chomp) 
 	# 	@task_list[pos].change_update_content_state!
 	# end

 	# Cambiado para sinatra
 	def change_task_content_of_list(id, new_content)
 		pos = find_task_by_id(id)
 		@task_list[pos].change_update_content(new_content) 
 		@task_list[pos].change_update_content_state!
 	end

 	def sort_by_created (dir = "A")
 		if (dir == "A") 
 			@task_list = @task_list.sort { | task1, task2 | task1.created_at <=> task2.created_at }
 		else
 			@task_list = @task_list.sort { | task1, task2 | task2.created_at <=> task1.created_at }
 		end
 	end

 	def save_task_list
	  @todo_store.transaction do 
	      @todo_store[@user] = @task_list
	  end
	end

 end 
