class StarshipsCli::CLI  

    def call 
        puts "Welcome user"
        puts "To see starships, enter 'starships'"
        puts "To exit the galaxy, enter 'exit'"
        API.get_data
        menu
    end 

    def menu 
        input = gets.strip.downcase

        if input == "starships"
            starships_list
            menu
        elsif input == "exit"
            goodbye      
        else 
            invalid_entry
        end
    end 

    def starships_list
        Starship.all.each_with_index do |starship, index|
            puts "#{index + 1}. #{starship.name}"
        end 
        puts ""
        puts ""
        puts "which starship would you like detail about:"
        input = gets.strip.downcase

        starship_selection(input)
    end 

    def starship_selection(starship)
        ship = Starship.find_by_name(starship)
        ship.each do |s|
         puts " Name: #{s.name}"
         puts " Model: #{s.model}"
         puts " Manufacturer: #{s.manufacturer}"
         puts " Starship Class: #{s.starship_class}"
        end
        #go over my starship array, find method to find the starship selected 
    end 

    def goodbye
        puts "Goodbye, May the force be with you"
    end 

    def invalid_entry
        puts "Invalid entry, try again"
        menu
    end 

end 