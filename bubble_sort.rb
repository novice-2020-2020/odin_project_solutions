def bubble_sort(a)
  a.each do
  for i in (0..a.size-1) do
    if a[i+1] == nil
      break
    else
      if a[i] > a[i+1]  
        a[i],a[i+1] = a[i+1], a[i]
      end
    end
  end
  end
a
end
a = [4,3,78,2,0,2]
bubble_sort(a)