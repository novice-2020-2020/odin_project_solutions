prices = [17,3,6,9,15,8,6,1,10]

def min_hash_val(hash)
  hash.min_by{|k,v| k}
end

def stock_pick(dict)
  price_pairs = {}
  for i in  (0..dict.size-1) do
    price_buy = dict[i]
    for j in (i..dict.size-1) do
      price_sell = dict[j]
      diff = price_buy-price_sell
      price_pairs[diff] = Array([price_buy,price_sell, price_buy-price_sell])
    end
    
  end
  final_pair = min_hash_val(price_pairs)
  final_buy_price = final_pair[1][0]
  final_sell_price = final_pair[1][1]
    puts "buy at ".concat(final_buy_price.to_s).concat(" and sell at ").concat(final_sell_price.to_s).concat(" for a profit of ").concat((final_sell_price - final_buy_price).to_s)
end

stock_pick(prices)