module Enumerable
  
  def my_each_with_index
    return self unless block_given?

    i = 0
    while i < length
      yield(self[i], i)
      i += 1    
    end
    self
  end

  def my_select
    arr = []
    return self unless block_given?

    for item in self
      yield(item) ? arr << item : next
    end
    arr
  end

  def my_all?
    return self unless block_given?

    for item in self
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

    for item in self
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

    for item in self
      if yield(item)
        return false
      end
    end
    true
  end

  def my_count
    return self.length unless block_given?

    count = 0
    for item in self
      yield(item) ? count += 1 : next
    end
    count
  end

  def my_map
    return self unless block_given?

    arr = []
    for item in self
      arr << yield(item)
    end
    arr
  end

  def my_inject(val)
    return self unless block_given?

    total = val
    for item in self
      total = yield(total, item)
    end
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
