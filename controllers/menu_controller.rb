# #1
require_relative "../models/address_book.rb"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
  #def run
# #2
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "

# #3
    selection = $stdin.gets.chomp.to_i
    #puts "You picked #{selection}"
# # 7
    case selection
       when 1
         puts "You picked #{selection}"
         view_all_entries
        #  run
         main_menu

       when 2
         create_entry
         main_menu
       when 3
         puts "You picked #{selection}"
         search_entries
         main_menu
       when 4
         read_csv
         main_menu
       when 5
         puts "Good-bye!"
         # #8
       exit(0)
       main_menu
 # #9
     else
       puts "#{selection} is not a valid input"
      #  system "clear"
       #{puts "Sorry, that is not a valid input"}
       entries_submenu
     end
   end

 # #10
   def view_all_entries
     # #14
     @address_book.entries.each do |entry|
     puts entry.to_s
 # #15
       entry_submenu(entry)
     end
     #
    #  system "clear"
     puts "End of entries"
   end

def edit_entry(entry)
    print "Updated name: "
    name = $stdin.gets.chomp
    print "Updated phone number: "
    phone_number = $stdin.gets.chomp
    print "Updated email: "
    email = $stdin.gets.chomp

    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?

    puts "Updated entry: "
    puts entry
end
   def create_entry
     # #11
     puts "New AddressBloc Entry"
 # #12
     print "Name: "
     name = $stdin.gets.chomp
     print "Phone number: "
     phone = $stdin.gets.chomp
     print "Email: "
     email = $stdin.gets.chomp

 # #13
     @address_book.add_entry(name, phone, email)

     puts "New entry created"

    #  system "clear"
    #  puts "New entry created"

   end

   def search_entries
   end

   def read_csv
   end

   def entries_submenu(entry)
 # #16
     puts "\nEntry Submenu"
     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

 # #17
     selection = $stdin.gets.chomp

     case selection
 # #18
     when "n"
 # #19
     when "d"
     when "e"
       edit_entry(entry)
       entries_submenu(entry)
 # #20
     when "m"
       system "clear"
       #main_menu
       run
     else
       #system "clear"
       puts "#{selection} is not a valid input"
       entries_submenu
     end
   end
  end
