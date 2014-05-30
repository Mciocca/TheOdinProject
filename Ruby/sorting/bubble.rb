def bubble_sort(arr)
  ((arr.size)-1).times do 
    i = 0
    arr.each do |num|
      if arr[i+1] != nil && num > arr[i+1] 
        arr[i] = arr[i+1]
        arr[i + 1] = num
      end
      i +=1 
    end  
  end 
  arr   
end


def bubble_sort_by(arr)
  ((arr.size)-1).times do 
    i = 0
    arr.each do |num|
      if arr[i+1] != nil && yield(num, arr[i+1]) < 0
        arr[i] = arr[i+1]
        arr[i + 1] = num
      end  
      i +=1 
    end  
  end 
  print arr   
end

p bubble_sort([1, 5, 5, 20, 20, 5 ,1,2])

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  right.length - left.length
end