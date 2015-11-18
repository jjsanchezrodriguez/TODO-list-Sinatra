require_relative "sinatra.rb"
require_relative "task.rb"

probar_lista = TodoList.new("Pedrito")
system("clear")
begin
	puts "1.  Añadir una tarea"
	puts "2.  Borrar por id"
	puts "3.  Modificar content por id"
	puts "4.  Buscar por id"
	puts "5.  Odenar"
	puts "6.  Completar Tarea"
	puts "7.  Reiniciar Tarea"
	puts "8.  Mostrar "
	puts "9.  Limpiar "
	puts "10. Guardar "
	puts "0.  Salir "

	puts "Que vamos hacer"
	option = gets.chomp.to_i
	case option
		when 1	
			puts "Escriba la nueva tarea"
			probar_lista.add_item_list(gets.chomp)
			puts "La tarea ha sido añadida"

		when 2	
			id = probar_lista.choose_task_list_by_id
			probar_lista.delete_task_by_id(id)
			puts "La tarea ha sido borrada"

		when 3
			id = probar_lista.choose_task_list_by_id
			probar_lista.change_task_content_of_list(id)
			puts "La tarea ha sido modificada"

		when 4
			id = probar_lista.choose_task_list_by_id
			pos = probar_lista.find_task_by_id(id)
			puts probar_lista.show_task_in_list(pos)
			puts "La tarea ha sido encontrada"

		when 5
			probar_lista.sort_by_created("B")

		when 6
			id = probar_lista.choose_task_list_by_id
			pos = probar_lista.find_task_by_id(id)
			probar_lista.complete_task(pos)
		
		when 7
			id = probar_lista.choose_task_list_by_id
			pos = probar_lista.find_task_by_id(id)
			probar_lista.change_state_task(pos)

		when 8
			probar_lista.show_task_list

		when 9
			system("clear")

		when 10
			save_task_list

		when 0
			puts "Sayonara Baby....."
		else
			puts "Eres un lechon introduce una opción valida!!!!"	

	end
	# binding.pry
	

end while(option != 10)


