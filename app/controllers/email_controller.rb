class EmailController < ApplicationController
    def email_form
    end
    
    def send(*)
        email = params[:email]
        title = params[:title]
        content = params[:content]
        gmail = Gmail.connect("syjung@likelion.org", "shb04270")
        gmail.deliver do
            to email
            subject title
            text_part do
                body content
            end
        end
        gmail.logout
    end
    
    def email_send
    end
end