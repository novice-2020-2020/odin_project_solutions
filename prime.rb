#check if a number is prime
def check_prime(n)
  prime = [2]
  for x in (2..Math.sqrt(n))
    if n.to_i % x.to_i==0
      return false
    end
  end
end

#prime numbers till nth number
def prime_till_n(n)
  prime_n = [2]
  for x in (3..n)
    if check_prime(x)
      prime_n<<x
    end
  end
  prime_n
end
prime_till_n(10)

#first n prime
i=0
primes = []
x=2
while i<10
    if check_prime(x)
      i+=1
      primes<<x
      
    end
    x+=1
  end
  primes.size