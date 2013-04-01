class UserMailer < ActionMailer::Base
  
  def registration_confirmation(user)
    
    if (match = /^(.+)@hcp\.com$/i.match(user.email))
      
      @message =
      
"#{match[1].capitalize},

Thank you for checking us out! This is a barebone but functional prototype of Stone Soup,
submitted as supplementary material for our Summer@Highland application. We will develop it into a minimum viable product,
especially if we get accepted :)
      
Jason & Ken"
    
    elsif (match = /^(.+)@lsvp\.com$/i.match(user.email))
    
      @message =
      
"#{match[1].capitalize},

Thank you for checking us out! This is a barebone but functional prototype of Stone Soup,
submitted as supplementary material for our Summer Fellowship application. We will develop it into a minimum viable product,
especially if we get accepted :)

Jason & Ken"
      
    elsif (match = /^(.+)@.+\..+/i.match(user.email))
      
      @message =
      
"#{match[1].capitalize},

Thank you for checking us out! This is a barebone, but functional prototype of Stone Soup.
Look around, play with it, and come back often: it's in rapid development!

Jason & Ken"
      
    end
    
    mail(:from => "chuanchih@gmail.com", :to => user.email, :subject => "Thank you for trying out Stone Soup!")
    
  end
  
end
