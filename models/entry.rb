#modals/entry.rb

#A stub in programming terminology is an empty class, or
#method. A stub is sort of like a pencil sketch for a painting:
#we create a sketch of what we're going to paint first and then
#fill in the rest with actual paint later.

#Entry instance to have a few methods for accessing a name, a
#phone number and an email.

class Entry

  # These must be accessors since we mutate them
   attr_accessor :name, :phone_number, :email

   def initialize(name, phone_number, email)

      @name = name
      @phone_number = phone_number
      @email = email
   end

   # #7 we create the string we want. The \n character is the newline character.
      #It prints a newline to the console.

   def to_s
     "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
   end
 end
