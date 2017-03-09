defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, b} = KV.Bucket.start_link
    # Note that we need a mechanism to pass the bucket pid from the callback
    # to the test. We do so by using the test context. When we return
    # {:ok, bucket: bucket} from the callback, ExUnit will merge the second
    # element of the tuple (a dictionary) into the test context.
    # The test context is a map which we can then match in the test definition,
    # providing access to these values inside the block test:
    {:ok, b: b}
  end
  test "stores values by key", %{b: b} do
    #{:ok, bucket} = KV.Bucket.start_link
    assert KV.Bucket.get(b, "transcript") == nil

    KV.Bucket.put(b, "transcript", 3)
    assert KV.Bucket.get(b, "transcript") == 3
    KV.Bucket.delete(b, "transcript")
    assert KV.Bucket.get(b, "transcript") == nil
  end
end
