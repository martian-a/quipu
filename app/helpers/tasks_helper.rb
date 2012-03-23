module TasksHelper
  
  def show_created_at()
    if (controller.action_name == 'all')
      return true
    end
    return false
  end
  
  def show_status()
    if (controller.action_name == 'overdue' || controller.action_name == 'incomplete' || controller.action_name == 'complete')
      return false
    end
    return true
  end
  
end
