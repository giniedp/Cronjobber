module Cronjobber
  module TasksHelper
    
    def execute_cronjob_tasks tasks=nil
      tasks = Array(tasks) + Cronjobber.tasks
      tasks.map! do |task|
        if task.is_a? String
          task = task.constantize 
        else
          task
        end
      end      
      tasks.map do |task|
        task.cronjob_perform
      end
    end
    
  end
end