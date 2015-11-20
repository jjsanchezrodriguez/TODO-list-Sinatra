  require_relative "../lib/sinatra"
	require "spec_helper"

  describe "TodoList" do
  let(:list) {TodoList.new("Pedro")}
  
  it "return name user" do
    expect(list.user).to eq("Pedro")
  end

  it "return content add task" do
  	list.add_item_list("Ir al cine")
    expect(list.task_list.last.content).to eq("Ir al cine")
  end

  it "return id task" do
  	list.add_item_list("Hola que tal")
    expect(list.task_list.last.id).to eq(8)
  end


  it "return size of list after delete" do
    list.delete_task_by_id(1)
    expect(list.task_list.length).to eq(2)
  end

  it "change state of a task" do
    # pos = list.choose_task_list para el progrma
    pos = 1 #para spec
    expect(list.task_list[pos].complete?).to eq(false)
    expect(list.task_list[pos].complete!).to eq(true)
    list.change_state_task(pos)
    expect(list.task_list[pos].complete?).to eq(false)
  end 

  it "change content task and state_content" do
    pos = 1
    list.task_list[pos].change_update_content("Probando") 
    expect(list.task_list[pos].update_content).to eq(nil)
    list.task_list[pos].change_update_content_state!

    expect(list.task_list[pos].content).to eq("Probando")
    expect(list.task_list[pos].update_content).to eq(true)
  end

  #Becareful check
  it "find task by id" do
    expect(list.find_task_by_id(1).to_i).to eq(0)
  end

  it "show content find task by " do
    pos = list.find_task_by_id(1).to_i
    expect(list.show_task_in_list(pos)).to eq("Comprar Patatas")
  end 
 
  it "find task by id check nil" do
    expect(list.find_task_by_id(7)).to eq(nil)
  end

  it "show content find task by id check nil" do
    pos = list.find_task_by_id(7) 
    expect(list.show_task_in_list(pos)).to eq(nil)
  end 

  it "save task list in public/tasks.yml" do
    # list.save_task_list
  end

 

end 
