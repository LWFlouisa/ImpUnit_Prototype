require "decisiontree"

def write_fruit
  open('routines/SmartSearch/_scripts/scripts.sen', 'w') { |f|
      f.puts "? |txt| present? fruit"
  }

  puts 'Is the text file with a fruit in it present?'
end

def write_basketcase
  open('routines/SmartSearch/_scripts/scripts.sen', 'w') { |f|
      f.puts "? |txt| present? basketcase"
  }

  puts 'Is the text file with a basketcase in it present?'
end

def write_clogs
  open('routines/SmartSearch/_scripts/scripts.sen', 'w') { |f|
      f.puts "? |txt| present? clogs"
  }

  puts 'Is the text file with the clogs in it present?'
end

def write_kite
  open('routines/SmartSearch/_scripts/scripts.sen', 'w') { |f|
      f.puts "? |txt| present? kite"
  }

  puts 'Is the text file with the kite in it present?'
end

# Coverts a number to an input vector.
number = File.read("data/input_vector/i_number.txt").strip.to_i

# From number use it to choose a command to write
attributes = ['Command']

training = [
  [1.0,        'fruit'],
  [2.0,   'basketcase'],
  [3.0,        'clogs'],
  [4.0,         'kite'],
]

# Instantiate the tree, and train it based on the data (set default to '1')
dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :continuous)
dec_tree.train

test = [number]

decision = dec_tree.predict(test)

puts "Predicted: #{decision} ... True decision: #{test.last}"

if    decision ==      'fruit'
  write_fruit
elsif decision == 'basketcase'
  write_basketcase
elsif decision ==      'clogs'
  write_clogs
elsif decision ==       'kite'
  write_kite
end

# Resets number value if greater than four, otherwise increments input by one.
if number > 4
  number = 0

  open("data/input_vector/i_number.txt", "w") { |f|
    f.puts number
  }
else
  number = number + 1

  open("data/input_vector/i_number.txt", "w") { |f|
    f.puts number
  }
end
