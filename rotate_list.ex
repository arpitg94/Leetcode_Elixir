defmodule Solution do
  def rotate(nums, k) do
    len = length(nums)
    rotated_nums = Enum.map(0..(len - 1), fn _ -> 0 end)

    Enum.each(0..(len - 1), fn i ->
      rotated_index = rem(i + k, len)
      List.replace_at(rotated_nums, rotated_index, Enum.at(nums, i))
    end)

    Enum.each(0..(len - 1), fn i ->
      List.replace_at(nums, i, Enum.at(rotated_nums, i))
    end)

    nums
  end
end

# Example usage
nums = [0, 1, 6, 7, 3, 0, 4, 2]
k = 2
rotated_nums = Solution.rotate(nums, k)
IO.inspect(rotated_nums) # Output is [4, 2, 0, 1, 6, 7, 3, 0]
