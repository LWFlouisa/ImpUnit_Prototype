require_relative "senspace.rb"

searchParser      # Create the parser
searchTransform   # Create the transformer

def interpret
  searchInterpreter # Detect a single file in an interpreter.
  searchQuery
  searchFileType
end

def multisearch # essentially a brute force search.
  searchMultisearch # Detect multiple files in a script.
end

# interpret
multisearch