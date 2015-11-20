  require_relative "../lib/task"
	require "spec_helper"

  describe "Task" do
  let(:task) {Task.new("Ir al cine")}
  
  it "return the content task" do
    expect(task.content).to eq("Ir al cine")
  end
  
  it "return id task" do
    expect(task.id).to eq(2)
  end

  it "return state of my task" do
    expect(task.complete?).to eq(false)
  end

  it "return make_incomplate" do
    expect(task.complete!).to eq(true)
  end

  it "return new fild created_at" do
    expect(task.created_at.strftime("%x")).to eq("11/19/15")
  end

  it "return new content task" do
    expect(task.update_content).to eq(nil)
    task.change_update_content_state!
    expect(task.update_content).to eq(true)
  end

  it "return new content task" do
    task.change_update_content("pololo")
    expect(task.content).to eq("pololo")
  end 

   it "return new name" do
    task.change_update_content("pololo")
    expect(task.content).to eq("pololo")
  end 



end 