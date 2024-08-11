defmodule Solution do
  def remove_duplicates(nums) do
    nums
    |> Enum.reduce({[], nil}, fn x, {acc, last_seen} ->
      if x != last_seen do
        {acc ++ [x], x}
      else
        {acc, last_seen}
      end
    end)
    |> elem(0)
  end
end

defmodule Main do
  def main do
    nums = [0, 1, 2, 2, 3, 3, 4, 4]

    unique_nums = Solution.remove_duplicates(nums)

    IO.inspect(unique_nums)  # Output: [0, 1, 2, 3, 4]
  end
end

Main.main()
