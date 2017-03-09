defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  test "stores values by key" do
    {:ok, bucket} = KV.Bucket.start_link
    assert KV.Bucket.get(bucket, "transcript") == nil

    KV.Bucket.put(bucket, "transcript", 3)
    # assert KV.Bucket.get(bucket, "transcript") == 3
  end
end
