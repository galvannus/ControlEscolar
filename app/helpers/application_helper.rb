module ApplicationHelper
    def resource
        #Asigna a @resource User.new si esta basia la vaiable
        @resource ||= User.new
    end

    def resource_name
        :user
    end

    def resource_class
        User
    end
    
end
