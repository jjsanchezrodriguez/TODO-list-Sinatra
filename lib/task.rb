require "time"

class Task
    attr_reader :content, :id, :complete, :created_at, :update_content
    @@current_id = 1
    def initialize(content, user = "")
        @content = content
        @id = @@current_id
        @@current_id += 1
        @complete = false
        @created_at = Time.now
        @update_content = nil
    end 

    def complete?
    	@complete
    end

    def complete!
    	@complete = true
    end 

    def make_incomplete!
    	@complete = false
    end

    def change_update_content_state!
        @update_content = true 
    end

    def change_update_content(content)
        @content = content
    end

end