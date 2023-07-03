class EmailMailer < ApplicationMailer


    def log_in_email(email)
        mail to: email,
        from: "apimanagement23@gmail.com",
        subject: 'Login mail',
        body: "Successfully logged in"
    end
        
    def logout(email)
        mail to: email,
        from: "apimanagement23@gmail.com",
        subject: 'Logout mail ',
        body: "Successfully logout"
        
    end
    
        
        
        
        
        
end
