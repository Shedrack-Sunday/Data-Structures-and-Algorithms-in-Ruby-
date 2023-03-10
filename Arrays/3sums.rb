# Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

# Notice that the solution set must not contain duplicate triplets.

 

# Example 1:

# Input: nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]
# Explanation: 
# nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
# nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
# nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
# The distinct triplets are [-1,0,1] and [-1,-1,2].
# Notice that the order of the output and the order of the triplets does not matter.
# Example 2:

# Input: nums = [0,1,1]
# Output: []
# Explanation: The only possible triplet does not sum up to 0.
# Example 3:

# Input: nums = [0,0,0]
# Output: [[0,0,0]]
# Explanation: The only possible triplet sums up to 0.
 

# Constraints:

# 3 <= nums.length <= 3000
# -105 <= nums[i] <= 105


# with Explanation

def three_sum(nums)
  # Edge case: if the length of `nums` is less than 3, it's not possible to form a triplet
  return [] if nums.length < 3

  # Sort the array so that we can use two pointers to iterate through the array
  nums.sort!

  # Initialize an empty result array
  result = []

  # Iterate through the array
  (0...nums.length).each do |i|
    # Skip duplicate values to avoid getting the same triplets
    next if i > 0 && nums[i] == nums[i-1]

    # Initialize the two pointers
    left = i + 1
    right = nums.length - 1

    # Use two pointers to find the other two values that sum up to 0
    while left < right
      sum = nums[i] + nums[left] + nums[right]

      # If the sum is 0, add the triplet to the result array and move the pointers
      if sum == 0
        result << [nums[i], nums[left], nums[right]]
        left += 1
        right -= 1

        # Skip duplicate values
        while left < right && nums[left] == nums[left-1]
          left += 1
        end
        while left < right && nums[right] == nums[right+1]
          right -= 1
        end
      # If the sum is less than 0, move the left pointer
      elsif sum < 0
        left += 1
      # If the sum is greater than 0, move the right pointer
      else
        right -= 1
      end
    end
  end

  # Return the result array
  result
end


# Pure code


def three_sum(nums)
  return [] if nums.length < 3
  nums.sort!
  result = []
  (0...nums.length).each do |i|
    next if i > 0 && nums[i] == nums[i-1]
    left = i + 1
    right = nums.length - 1
    while left < right
      sum = nums[i] + nums[left] + nums[right]
      if sum == 0
        result << [nums[i], nums[left], nums[right]]
        left += 1
        right -= 1
        while left < right && nums[left] == nums[left-1]
          left += 1
        end
        while left < right && nums[right] == nums[right+1]
          right -= 1
        end
      elsif sum < 0
        left += 1
      else
        right -= 1
      end
    end
  end
  result
end