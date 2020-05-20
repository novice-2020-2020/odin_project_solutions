def caesar_1(x,n)
    source_array = [*'a'..'z', *'A'..'Z', *'0'..'9']
    small = Array(("a".."z"))
    big = Array(("A".."Z"))
    num = Array(0..9)
    new_str = ''
    for let in x.split('') do
        if small.include?(let) || big.include?(let) || num.include?(let)
            if let.to_i == 0
                if let.upcase == let
                    if 26 - big.index(let.to_s) < n
                        new_str.concat(big[(26-n-big.index(let.to_s)).abs])
                    else
                        new_str.concat(big[big.index(let.to_s)+n])
                    end
               elsif let.upcase != let

                    if 26 - small.index(let.to_s) < n
                        new_str.concat(small[(26-n-small.index(let.to_s)).abs])
                    else
                        new_str.concat(small[small.index(let.to_s)+n])
                    end
                end
            else
                
                new_str.concat(num[num.index(let.to_i)].to_s)
            end
        else
            new_str.concat(let)
        end

    end
    puts new_str
end

caesar_1('What a string!', 5)
caesar_1('AbCdEFG123!', 3)