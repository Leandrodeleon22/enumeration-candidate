# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  # Your code Here
  @candidates.find { |candidate| candidate[:id] == id}
end

def experienced?(candidate)
  # Your code Here
  candidate[:years_of_experience] >= 2
end

def knows_ruby_python?(candidate)

  candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")

end


def applied?(candidate)
(Date.today - candidate[:date_applied]).to_i <= 15
end

def ordered_by_qualifications(candidate)
candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end



#   # More methods will go below


def qualified_candidates(candidates)
  # Your code Here
  candidates.select do |candidate|
    experienced?(candidate) &&
    candidate[:github_points] >= 100 &&
    knows_ruby_python?(candidate) &&
    applied?(candidate) &&
    candidate[:age] > 17
  end
  
end