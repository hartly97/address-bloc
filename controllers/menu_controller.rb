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
      end

      def read_csv
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
       when "e"
       when "m"# #20
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         entry_submenu(entry)
     end
   end
 end
