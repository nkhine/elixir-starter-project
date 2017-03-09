defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, b} = KV.Bucket.start_link
    #return key:value
    {:ok, b: b}
  end
  test "stores values by key", %{b: b} do
    #{:ok, bucket} = KV.Bucket.start_link
    assert KV.Bucket.get(b, "transcript") == nil

    KV.Bucket.put(b, "transcript", 3)
    assert KV.Bucket.get(b, "transcript") == 3
  end
end
