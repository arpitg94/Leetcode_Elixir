defmodule Solution do
  def merge(nums1, m, nums2, n) do
    merged_list = List.duplicate(0, m + n)
    merge_lists(nums1, m - 1, nums2, n - 1, merged_list, m + n - 1)
  end

  defp merge_lists(nums1, i, nums2, j, merged_list, k) when i >= 0 and j >= 0 do
    if Enum.at(nums1, i) > Enum.at(nums2, j) do
      merged_list = List.replace_at(merged_list, k, Enum.at(nums1, i))
      merge_lists(nums1, i - 1, nums2, j, merged_list, k - 1)
    else
      merged_list = List.replace_at(merged_list, k, Enum.at(nums2, j))
      merge_lists(nums1, i, nums2, j - 1, merged_list, k - 1)
    end
  end

  defp merge_lists(nums1, i, nums2, j, merged_list, k) when i >= 0 do
    merged_list = List.replace_at(merged_list, k, Enum.at(nums1, i))
    merge_lists(nums1, i - 1, nums2, j, merged_list, k - 1)
  end

  defp merge_lists(nums1, i, nums2, j, merged_list, k) when j >= 0 do
    merged_list = List.replace_at(merged_list, k, Enum.at(nums2, j))
    merge_lists(nums1, i, nums2, j - 1, merged_list, k - 1)
  end

  defp merge_lists(_, _, _, _, merged_list, _) do
    merged_list
  end
end

nums1 = [1, 2, 3, 0, 0, 0]
m = 3
nums2 = [2, 5, 6]
n = 3

merged_nums1 = Solution.merge(nums1, m, nums2, n)
IO.inspect(merged_nums1)
