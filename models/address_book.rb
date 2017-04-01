    # #8 load entry.rb relative to address_book.rb's file using require_relative
 require_relative 'entry'
 require "csv"
    #7

   class AddressBook
     attr_reader :entries

     def initialize
       @entries = []
     end

     # #9 create a variable to store the insertion index
     def add_entry(name, phone_number, email)
       index = 0
       entries.each do |entry|
         if name < entry.name # #10  compare name with current entry.
           break
         end
         index+= 1
     end
     entries.insert(index, Entry.new(name, phone_number, email))
  end


  def import_from_csv(file_name)# #7 use the CSV class to parse the file
    # Implementation goes here
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    csv.each do |row|# #8
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end

  # Search AddressBook for a specific entry by name
 def binary_search(name)
     # #1 rightmost item is the entries.length-1
     lower = 0
     upper = entries.length - 1

     # #2 lower index is less than or equal to our upper index.
     while lower <= upper
       # #3 store it in mid_name
       mid = (lower + upper) / 2
       mid_name = entries[mid].name

       # #4 compare for name, to the name of  middle index, mid_name
       if name == mid_name
         return entries[mid]
       elsif name < mid_name
         upper = mid - 1
       elsif name > mid_name
         lower = mid + 1
       end
     end

     # #5
     return nil
   end

   def iterative_search(name)
    current = 0
    upper = entries.length - 1

    while current <= upper
      current_name = entries[current].name
      if name == current_name
        return entries[current]
      else
        current += 1
    end
  end
    return nil
  end

   def remove_entry(name, phone_number, email) # #11 insert a new entry into entries using the calculated `index.
    entries.delete_if{|entry| entry.name == name }
   end
 end
