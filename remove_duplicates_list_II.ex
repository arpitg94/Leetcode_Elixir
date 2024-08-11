defmodule Solution do
  def remove_duplicates(nums) do
    nums
    |> Enum.reduce({[], 0, 0}, fn num, {acc, k, prev_i} ->
      if prev_i == 0 or hd(acc) != num do
        if length(acc) - prev_i > 1 do
          {acc ++ [hd(acc), hd(acc)], k + 2, length(acc)}
        else
          {acc ++ [num], k + 1, length(acc)}
        end
      else
        {acc, k, prev_i}
      end
    end)
    |> elem(1)
  end
end

defmodule Main do
  def main do
    nums = [0, 1, 2, 2, 3, 3, 4, 4]

    k = Solution.remove_duplicates(nums)

    IO.inspect(Enum.take(nums, k))  # Output: [0, 1, 2, 2, 3, 3, 4, 4]
  end
end

Main.main()
