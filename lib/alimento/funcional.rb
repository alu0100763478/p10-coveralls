def ordenados_for(array)
  list = array.dup
  return list if list.size <= 1 # already sorted
  swapped = true
  while swapped do
    swapped = false
    0.upto(list.size-2) do |i|
      if (i<list.size-1) && (list[i].ve > list[i+1].ve)
        list[i], list[i+1] = list[i+1], list[i] # swap values
        swapped = true
      end
    end    
  end
  list
end

def ordenados_each(array)
  list = array.dup
 # list = copia_ve(array)
  return list if list.size <= 1 # already sorted
  swapped = true
  while swapped do
    swapped = false
    list.each_with_index   do |alimento,i|
      if (i<list.size-1) && (list[i].ve > list[i+1].ve)
        list[i], list[i+1] = list[i+1], list[i] # swap values
        swapped = true
      end
    end    
  end
  list
end    
