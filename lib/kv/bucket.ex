defmodule KV.Bucket do
  @doc """
  Starts a new bucket/stores
  """
  def start_link do
    Agent.start_link(fn -> %{} end)
  end
  @doc """
  Gets a value from the `bucket` by `key`
  KV.Bucket.get(bucket, "transcript") == 3
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end
  @doc """
  Puts the `value` for the given `key` in the `bucket`
  """
  def put(b, k, v) do
    Agent.update(b, &Map.put(&1, k, v))
  end
  @doc """
  Besides getting a value and updating the agent state, agents allow us to get
  a value and update the agent state in one function call via
  Agent.get_and_update/2
  Deletes `key` from `bucket`.

  Returns the current value of `key`, if `key` exists.
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
