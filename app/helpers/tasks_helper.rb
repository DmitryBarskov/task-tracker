module TasksHelper

  def change_status(task)
    if task.status == "not_started"
      task.status = "started"
    elsif task.status == "started"
      task.status = "finish"
    else
      task.status = "started"
    end  
   end 
end