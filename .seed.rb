# Standard brute force search.
def standard_search
  number = 0

  options_list = File.read("options/option_list.txt").to_s.split(" ") #.shuffle

  # Candidate files
  candidate = File.read("candidate/algorithm_candidate.txt").strip.to_s

  # Bases iteration limit on options list size.
  size_limit = options_list.size.to_i

  # Iterate size limit times comparing option with candidate.
  size_limit.times do
    option = options_list[number].strip.to_s

    print "Candidate: #{candidate} Option: #{option} >>"

    if option == candidate
      puts " #{option} matches the candidate #{candidate}."

      # From matching candidate choose this script to write.
      open("exec.sh", "w") { |f|
        f.puts option.tr "_", " "
      }

      system("chmod 777 -R exec.sh")

      # Exit script
      abort
    else
      puts " #{option} does not match the candidate #{candidate}."
    end

    sleep(3)

    number = number + 1
  end

  sleep(3)

  system("clear")
end

standard_search
