require_relative '../models/entry' #imports class into our test

 # #1 file is a spec file and that it tests Entry.
 RSpec.describe Entry do

     # #2 describe our test structure. specs test the Entry attributes.
   describe "attributes" do
     let(:entry) { Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com') }


     # #3 separate our individual tests using the it method.
        #Each it represents a unique test.
     it "responds to name" do
     # #4 each RSpec test ends with one or more expect
          #method, used to decl test expect
          expect(entry).to respond_to(:name)
     end

     it "reports its name" do
       expect(entry.name).to eq('Ada Lovelace')
     end

     it "responds to phone number" do
       expect(entry).to respond_to(:phone_number)
     end

     it "reports its phone_number" do
       expect(entry.phone_number).to eq('010.012.1815')
     end

     it "responds to email" do
       entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(entry).to respond_to(:email)
     end

      it "reports its email" do
        entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expect(entry.email).to eq('augusta.king@lovelace.com')
     end
   end

   # #5 describe block to separate to_s test from init tests.
    # # to_s indicates instance method.
    describe "#to_s" do
      it "prints an entry as a string" do
        entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"

    # #6 use eq to check to_s rtns a str == to expected_string
      expect(entry.to_s).to eq(expected_string)
    end
  end
end
