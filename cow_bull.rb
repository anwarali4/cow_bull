def cow_bull
	size = 4  # define size of word
	secret_word = [*'a' .. 'z'].sample(size)   # generate random word from a to z 
	guess_word = nil  # declare guess word
	
	i = 0 # counter variable
	# infinite loop
	loop do
		i = i + 1 # increment counter variable
		#infinite loop until user enter valid input  
		loop do
			print "Please enter a word of #{size} character and #{i} Attempt: "
			guess_word = gets.chomp.chars  # enter guess word
			#break if user enter valid input from this loop
			break if guess_word.size == size and guess_word.all? { |x| ('a'..'z').include? x } and guess_word.uniq.size == size
			puts "Please, try again. You enter a word and size of word #{size} and also unique"
		end
		bull = 0  # declare and initialize bull 
		cow = 0  # declare and initialize cow
		
		# iterate and count bull and cow if position and character are match then bull increment 
		# by one and only charcter are present in secret then cow are increment by one

		guess_word.each_with_index do |g, i|    
			if secret_word.include?(g)      
				if secret_word[i] == guess_word[i]        
					cow = cow + 1        
					bull = bull + 1      
				else        
					cow = cow + 1      
				end    
			end  
		end 
		# if bull is equal to size then break
		if bull == size
    	puts "Congratulations you  win the game in #{i} attempts"
    	break
  	end
		puts "Bull: #{bull}; Cow: #{cow}"
	end
end

a = cow_bull