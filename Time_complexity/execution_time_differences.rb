def my_min_slow(arr)
  i = 0
  while i < arr.length
    min = true
    j = 0
    while j < arr.length
      min = false if arr[j] < arr[i]
      j+=1
    end
    return arr[i] if min
    i+=1
  end
end


def my_min(arr)
  smallest = arr[0]

  arr.each_with_index do |el,i|
    if el < smallest
      smallest = el
    end
  end
  smallest
end


def sub_sum(arr)
  sum = 0
  i = 0
  while i < arr.length
    len = 1
    while len <= arr.length - i
      subarr = arr[i, len]
      new_sum = subarr.inject(:+)
      sum = new_sum if new_sum > sum
      len += 1
    end
    i += 1
  end
  sum

end


def sub_sum_two(arr)

  largest = arr.first

  current = arr.first

  (1...arr.length).each do |i|
    current = 0 if current < 0
    current += arr[i]
    largest = current if current > largest
  end
  largest
end


def anagrams(str1,str2)
  str1.chars.permutation(str1.length).each do |comb|
    return true if comb.join == str2
  end
  false
end

def anagrams_2(str1,str2)
  arr2 = str2.split("")
  str1.chars.each do |char|
    ind = arr2.find_index(char)
    arr2.delete_at(ind)
  end
  return true if arr2.empty?
end

def anagrams_3(str1,str2)
  str1.sort == str2.sort
end


def anagrams_4(str1, str2)

  freqs1 = Hash.new(0)
  freqs2 = Hash.new(0)

  str1.chars.each do |ch|
    freqs1[ch] += 1
  end

  str2.chars.each do |ch|
    freqs2[ch] += 1
  end

  freqs1 == freqs2
end

# time complexity = O(n^2)
def bad_two_sum?(arr, target)

  arr.each_with_index do |el, idx|
    arr[idx+1...arr.length].each do |el2|
      return true if el + el2 == target
    end
  end
  false
end


def ok_two_sum?(arr, target)

  sorted = arr.sort
  i,j = 0, arr.length - 1
  while i < j
    case (arr[i] + arr[j]) <=> target

    when 0
      return true
    when -1
      i+=1
    when 1
      j-=1
    end
  end
  false
end


def hash_sum(arr, target)
  hash = {}
  arr.each do |el|
    hash[el] = target - el
  end
p hash
  hash.each do |k,v|
    return true if hash.has_key?(v) && k != v
  end
  false
end
