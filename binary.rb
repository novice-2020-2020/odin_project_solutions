ar = [1,2,3,4,6,6,7,8,9,13,16,24,36,47,58,69,70]
n = 51
i = 0

while i!=ar.size do
  start = ar[0]
  final = ar[ar.size-1]
  mid = ar[(ar.size/2).floor]
  puts "start is #{start}, mid is #{mid}, end is #{final} in #{ar}"
  if ar.size==1 && ar[0]!=n
    puts "not in array, found after #{i} iterations"
    break
  
  elsif n==mid
    i+=1
    puts "#{n} found after #{i} iterations"
    break

  elsif n<mid
    puts "#{n} is less than #{mid}"
    ar = ar[0..ar.size/2.floor-1]
    start = ar[0]
    final = ar[ar.size-1]
    mid = ar[(ar.size/2).floor]
    i+=1

  elsif
    n>mid
    puts "#{n} is greater than #{mid}"
    ar = ar[(ar.size/2).floor+1..ar.size-1]
    start = ar[0]
    final = ar[ar.size-1]
    mid = ar[(ar.size/2).floor]
    i+=1
  end
end