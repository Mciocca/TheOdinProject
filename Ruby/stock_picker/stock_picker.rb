def stock_picker(arr)
  profit = 0
  best_days = []
  i = 0
  arr.size.times do
    buy_price = arr[i]  
    arr.each_with_index do |num, index|
      if index > arr.index(buy_price) && num - buy_price > profit
       profit = num - buy_price
       best_days = [arr.index(buy_price), index]
      end
    end
    i += 1
  end
  best_days
end

p stock_picker([17,3,6,9,15,8,6,1,10])

