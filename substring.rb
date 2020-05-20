dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit", "this", "Sparta"]
def substring(string,dict)
    source_arr = [*("a".."z"),*("A".."Z")]
    # substring = "Howdy partner, sit down! How's it going?"
    a = string.split(' ')

    counts = Hash.new(0)
    a.each do |let|
        dict.join(" ").split(' ').each do |word|
        if let.downcase.include?(word)
            counts[word]+=1
        else
            next
        end
    end
        # let.split('').each {|sublet| b.concat(sublet) if source_arr.include?(sublet) == true}
    end
    puts counts
end
substring("below", dictionary)    