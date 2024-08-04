module Enumerable
  
  def my_each_with_index
    return self unless block_given?

    index = 0
    self.my_each do |item|
      yield(item, index)
      index += 1
    end
  end

  def my_select
    arr = []
    return self unless block_given?

    self.my_each { |item| yield(item) ? arr << item : next}
    arr
  end

  def my_all?
    return self unless block_given?

    self.my_each do |item|
      if yield(item)
        next
      else
        return false
      end
    end
    true
  end

  def my_any?
    return self unless block_given?

    self.my_each do |item|
      if yield(item)
        return true
      else
        next
      end
    end
    false
  end

  def my_none?
    return self unless block_given?

    self.my_each do |item|
      if yield(item)
        return false
      end
    end
    true
  end

  def my_count
    return self.length unless block_given?

    count = 0
    self.my_each { |item| yield(item) ? count += 1 : next}
    count
  end

  def my_map
    return self unless block_given?

    arr = []
    self.my_each { |item| arr << yield(item)}
    arr
  end

  def my_inject(val)
    return self unless block_given?

    total = val
    self.my_each { |item| total = yield(total, item)}
    total
  end
end

class Array
  def my_each
    return unless block_given?

    for item in self
      yield item
    end
  end
end
