# http://codingdojo.org/cgi-bin/wiki.pl?KataMinesweeper

class Minesweeper
	def self.sweep_for_mines(input)
		array =	input.map {|outer| outer.map {|inner| inner == "." ? 0 : "*" }} # replace all the "." with 0's

		for x in 0..array.length - 1
			for y in 0..array[0].length - 1
					look_at_position(array, x, y)
			end
		end

		return array
	end

	private

	def self.look_at_position(array, x, y)
		if array[x][y] == "*"
			# have to look at the corners
			# and there's no sense in making it more robust at this point
			#   . . .
			#   . * .
			#   . . .
			increment_location(array, x - 1, y - 1)
			increment_location(array, x - 1, y)
			increment_location(array, x - 1, y + 1)
			increment_location(array, x, y - 1)
			increment_location(array, x, y + 1)
			increment_location(array, x + 1, y - 1)
			increment_location(array, x + 1, y)
			increment_location(array, x + 1, y + 1)
		end
	end

	def self.increment_location(array, x, y)
		if (x < array.length && x >= 0) && (y < array[0].length && y >= 0)
			if array[x][y] != "*"
				array[x][y] += 1
			end
		end
	end
end


puts 'loaded! Insert a board size'
array_size = gets.split

@rows = array_size[0].to_i
@columns = array_size[1]
@array = []

for i in 0..@rows - 1
	@array.push(gets.chomp.chars)
end


output = Minesweeper.sweep_for_mines(@array)
#puts "output:: #{output}"
#puts "@array:: #{@array}"
puts ""

for x in 0..output.length - 1
	output_str = ""
	for y in 0..output[x].length - 1 
		output_str << "#{output[x][y]} "
	end
	puts output_str
end
