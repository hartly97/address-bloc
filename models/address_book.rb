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

     def remove_entry(name, phone_number, email) # #11 insert a new entry into entries using the calculated `index.
      entries.delete_if{|entry| entry.name == name }
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

end
