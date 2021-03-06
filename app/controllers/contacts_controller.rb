class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new contact_params

        if @contact.valid?
            @contact.deliver
        else 
            flash.now[:error] = 'Cannot send message.'
            render :new
        end
    end
    
    def contact_params
        params.require(:contact).permit(:name, :email, :message)
    end
end
