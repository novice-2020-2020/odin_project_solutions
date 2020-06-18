ar = [5,2,8,1,90,100,999,123,0]

def selection_sort(ary)
  temp = 0
  for i in (0..ary.size-2)
    for j in (i..ary.size-1)
    # puts "i is #{ary[i]}, i+1 is #{ary[j]}, temp is #{temp}"
     if ary[i]>ary[j]
      temp = ary[i]
      ary[i] = ary[j]
      ary[j] = temp
    end
  end
  
end
return ary
end

selection_sort(ar)