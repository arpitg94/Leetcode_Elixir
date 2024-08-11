defmodule Solution do
  def remove_element(nums, val) do
    nums
    |> Enum.reduce({[], 0}, fn num, {acc, k} ->
      if num != val do
        {acc ++ [num], k + 1}
      else
        {acc, k}
      end
    end)
  end
end

defmodule Main do
  def main do
    nums = [0, 1, 2, 2, 3, 0, 4, 2]
    val = 2

    {filtered_nums, k} = Solution.remove_element(nums, val)

    IO.inspect(filtered_nums)  # Output: [0, 1, 3, 0, 4]
    IO.inspect(k)  # Output: 5
  end
end

Main.main()
