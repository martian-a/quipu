require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  test "check total fixtures" do
    assert_equal 6, Task.count
  end

  test "create new task" do
    task = Task.new

    task.summary = 'New task'
    task.deadline = Time.now
    task.complete = false

    assert task.save, "Unable to save a newly created task"
  end

  test "delete existing task" do
    task = tasks(:FutureIncomplete)

    assert task.destroy, "Unable to delete an existing task"
  end

  test "change summary of existing task" do
    task = tasks(:FutureIncomplete)
    
    originalSummary = task.summary    
    task.summary = 'New summary'
    
    assert task.save, "Unable to change the summary of existing task"
    assert task.summary != originalSummary, "Summary text hasn't changed"
  end

  test "change status of task from incomplete to complete" do
    testTask = tasks(:FutureIncomplete)
    assert !testTask.complete, "Task is unexpectedly complete"

    testTask.complete = true
    assert testTask.save, "Unable to change incomplete task to complete"
  end

  test "change status of task from complete to incomplete" do
    task = tasks(:FutureComplete)
    assert task.complete, "Task is unexpectedly incomplete"

    task.complete = false
    assert task.save, "Unable to change complete task to incomplete"
  end

  test "retrieve incomplete tasks" do
    tasks = Task.incomplete
    assert_equal 3, tasks.count
  end

  test "retrieve completed tasks" do
    tasks = Task.complete
    assert_equal 3, tasks.count
  end

  test "retrieve overdue tasks" do
    tasks = Task.overdue
    assert_equal 1, tasks.count
  end

  test "save task without a summary" do
    task = Task.new

    task.deadline = Time.now
    task.complete = false

    assert !task.save, "Saved task without a summary"
  end

  test "save task without a deadline" do
    task = Task.new
    
    task.summary = 'Task without a deadline'
    task.complete = false
    
    assert task.save, "Unable to save task without a deadline"
  end

  test "save task without completion status" do
    task = Task.new
    
    task.summary = 'Task without a completion status'
    task.deadline = Time.now

    assert !task.save, "Saved task without a completion status"
  end

end
