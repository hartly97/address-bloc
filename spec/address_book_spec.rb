require_relative '../models/address_book'

RSpec.describe AddressBook do

    # #1 new instance of the AddressBook model and assign it to the
    # #variable named book using the let syntax provided by RSpec.
    # #use book in all our tests, removing the duplication
   let(:book) { AddressBook.new }

   # #6 consolidates the redundant code
   def check_entry(entry, expected_name, expected_number, expected_email)
     expect(entry.name).to eq expected_name
     expect(entry.phone_number).to eq expected_number
     expect(entry.email).to eq expected_email
   end

   # #2 it explains the functionality of the method we're testing
   # # RSpec will take the content from describe and it and output them nicely to the command line

  describe "attributes" do
    it "responds to entries" do
      expect(book).to respond_to(:entries)
      book.import_from_csv("entries.csv")
      # Check the first entry
      # entry_one = book.entries[0]
    end
  end

    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      expect(book.entries.size).to eq(0)
    end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      #book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      #book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
end

  describe "#remove_entry" do
    it "removes only one entry from the address book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

      name = 'Someone'
      phone_number = '010.012.1815'
      email = 'some@one.com'
      book.add_entry(name, phone_number, email)
      expect(book.entries.size).to eq(2)

      book.remove_entry(name, phone_number, email)
      expect(book.entries.size).to eq(1)
    end
  end

  # Test that AddressBook's .import_from_csv() method is working as expected
   describe "#import_from_csv" do
     it "imports the correct number of entries" do
       # #3
       book.import_from_csv("entries.csv")#pass string as parameter
       book_size = book.entries.size

       # Check the size of the entries in AddressBook
       expect(book_size).to eq 5
     end
   end
   #is this the correct placement?
   # #4 first entry in the array of entries that our AddressBook stores.

     it "imports the 1st entry" do
       book.import_from_csv("entries.csv")
       # Check the first entry
       entry_one = book.entries[0]

       # #5 to verify that the first entry
       #expect(entry_one.name).to eq "Bill"
       #expect(entry_one.phone_number).to eq "555-555-4854"
       #expect(entry_one.email).to eq "bill@blocmail.com"
       check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
     end

    it "imports the 2nd entry" do
     book.import_from_csv("entries.csv")
     # Check the second entry
     entry_two = book.entries[1]
     #expect(entry_two.name).to eq "Bob"
     #expect(entry_two.phone_number).to eq "555-555-5415"
     #expect(entry_two.email).to eq "bob@blocmail.com"
     check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
   end

   it "imports the 3rd entry" do
     book.import_from_csv("entries.csv")
     # Check the third entry
     entry_three = book.entries[2]
     #expect(entry_three.name).to eq "Joe"
     #expect(entry_three.phone_number).to eq "555-555-3660"
     #expect(entry_three.email).to eq "joe@blocmail.com"
     check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
   end

   it "imports the 4th entry" do
     book.import_from_csv("entries.csv")
     # Check the fourth entry
     entry_four = book.entries[3]
     #expect(entry_four.name).to eq  "Sally"
     #expect(entry_four.phone_number).to eq "555-555-4646"
     #expect(entry_four.email).to eq "sally@blocmail.com"
     check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
   end

   it "imports the 5th entry" do
     book.import_from_csv("entries.csv")
     # Check the fifth entry
     entry_five = book.entries[4]
     #expect(entry_five.name).to eq "Sussie"
     #expect(entry_five.phone_number).to eq "555-555-2036"
     #expect(entry_five.email).to eq "sussie@blocmail.com"
     check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end
   end
 end
