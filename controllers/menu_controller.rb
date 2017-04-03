require_relative '../models/address_book'
# #1 include AddressBook using require_relative
 class MenuController
   attr_reader :address_book

   def initialize
     @address_book = AddressBook.new
   end

   def main_menu # #2 main menu opt cmd line
     puts "Main Menu - #{address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - Create an entry"
     puts "3 - Search for an entry"
     puts "4 - Import entries from a CSV"
     puts "5 - Exit"
     print "Enter your selection: "

    #  # gets removed
     # #3 retrieve user input
     selection = gets.to_i

    case selection # #7

      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        puts "Good-bye!"
        exit(0)# #8

      else # #9
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end

  def view_all_entries # #10
      address_book.entries.each do |entry|# #14
        system "clear"
        puts entry.to_s

        entry_submenu(entry)  # #15
      end

      system "clear"
      puts "End of entries"
  end


    #def view_by_n
    #  system "clear"
    #  puts "What is the entry number?"
    #  number = gets.chomp

      #if number.to_i < address_book.entries.length
      #  print address_book.entries[number.to_i]
      #else
      #  print "that is an invalid entry, please try again"
      #end
    #end

      def create_entry
       system "clear" # #11
       puts "New AddressBloc Entry"
       print "Name: " # #12
       name = gets.chomp
       print "Phone number: "
       phone = gets.chomp
       print "Email: "
       email = gets.chomp
       address_book.add_entry(name, phone, email) # #13

       system "clear"
       puts "New entry created"
      end


      def search_entries
      # #9
      print "Search by name: "
      name = gets.chomp

      # #10
      match = address_book.binary_search(name)
      system "clear"

      # #11
      if match
        puts match.to_s
        search_submenu(match)
      else
        puts "No match found for #{name}"
      end
    end

   def read_csv
     # #1
     print "Enter CSV file to import: "
     file_name = gets.chomp

     # #2
     if file_name.empty?
       system "clear"
       puts "No CSV file read"
       main_menu
     end

     # #3
       begin
         entry_count = address_book.import_from_csv(file_name).count
         system "clear"
         puts "#{entry_count} new entries added from #{file_name}"
       rescue
         puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
         read_csv
       end
  end
     def entry_submenu(entry)
    # #16
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp # #17

    case selection
      when "n" # #18
      when "d" # #19
          # #7
          delete_entry(entry)
      when "e"
          # #8
          edit_entry(entry)
          entry_submenu(entry)
      when "m"# #20
          system "clear"
          main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
end
   def delete_entry(entry)
     address_book.entries.delete(entry)
     puts "#{entry.name} has been deleted"
   end

   def edit_entry(entry)
     # #4
     print "Updated name: "
     name = gets.chomp
     print "Updated phone number: "
     phone_number = gets.chomp
     print "Updated email: "
     email = gets.chomp
     # #5
     entry.name = name if !name.empty?
     entry.phone_number = phone_number if !phone_number.empty?
     entry.email = email if !email.empty?
     system "clear"
     # #6
     puts "Updated entry:"
     puts entry
   end

   def search_submenu(entry)
   # #12 print out the submenu
   puts "\nd - delete entry"
   puts "e - edit this entry"
   puts "m - return to main menu"
   # #13 save the user input to selection
   selection = gets.chomp

   # #14
   case selection
     when "d"
       system "clear"
       delete_entry(entry)
       main_menu
     when "e"
       edit_entry(entry)
       system "clear"
       main_menu
     when "m"
       system "clear"
       main_menu
     else
       system "clear"
       puts "#{selection} is not a valid input"
       puts entry.to_s
       search_submenu(entry)
   end
  end
end
end
