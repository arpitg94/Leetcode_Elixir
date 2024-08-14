defmodule MajorityElement do
  def find_majority_element(nums) do
    {candidate, _votes} = Enum.reduce(nums, {nil, 0}, fn num, {candidate, votes} ->
      cond do
        votes == 0 ->
          {num, 1}

        num == candidate ->
          {candidate, votes + 1}

        true ->
          {candidate, votes - 1}
      end
    end)

    candidate
  end
end

nums = [1, 2, 2, 0, 2, 2, 2, 0, 0]
majority_element = MajorityElement.find_majority_element(nums)
IO.puts(majority_element)  # Output will be 2
