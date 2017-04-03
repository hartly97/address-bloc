 # #8 load entry.rb relative to address_book.rb's file using require_relative
 require_relative 'entry'
 require "csv"

  #7
  class AddressBook
     attr_reader :entries

     def initialize
       @entries = []
     end

     def nuke
       @entries = []
     end


     # #9 create a variable to store the insertion index
     def add_entry(name, phone_number, email)
       index = 0
       entries.each do |entry|
         # #10  compare name with current entry.
         if name < entry.name
           break
         end
         index+= 1
     end
     #11 using the calculated index
     entries.insert(index, Entry.new(name, phone_number, email))
  end

################ CSV ##########################
  # #7 use the CSV class to parse the file
  def import_from_csv(file_name)
    # Implementation goes here
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    csv.each do |row|
      # #8
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end

################ 2nd CSV ##########################

  def import_from_csv2(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    # #8 we iterate over the CSV::Table object's rows. On the next line we create a hash for each row. We convert each row_hash to an Entry by using the  add_entry method which will also add the Entry to the AddressBook's entries.
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end


################ Binary search #####################
  # Search AddressBook for a specific entry by name
  def binary_search(name)
     # #1 rightmost item is the entries.length-1
     lower = 0
     upper = entries.length - 1

     # #2 loop lower index is < or equ to upp ind.
     while lower <= upper
       # #3 store it in mid_name
       mid = (lower + upper) / 2
       mid_name = entries[mid].name

       # #4 compare name, to name of midd ind, mid_name
       if name == mid_name
         return entries[mid]
       elsif name < mid_name
         upper = mid - 1
       elsif name > mid_name
         lower = mid + 1
       end
     end

     # #5 div con to no match, rtn nil
     return nil
   end

   ############## assignment 8 ##################
   def iterative_search(name)
    ##current = 0
    ##upper = entries.length - 1
    entries.each do |entry|
      if entry.name == name
        return entry
      end
    ##while current <= upper
      ##current_name = entries[current].name
      ##if name == current_name
        ##return entries[current]
      ##else
        ##current += 1
    ##end
  end
    return nil
  end

   def remove_entry(name, phone_number, email) # #11 insert a new entry into entries using the calculated `index.
    entries.delete_if{|entry| entry.name == name }
   end
 end
