class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(params[:contact])

        if @contact.valid?
            @contact.deliver_now
        else 
            flash.now[:error] = 'Cannot send message.'
            render :new
        end
    end
    
end
