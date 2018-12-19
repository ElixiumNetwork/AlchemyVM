defmodule WaspVM.Store do
  require IEx
  alias WaspVM.Memory
  alias WaspVM.Store
  alias WaspVM.Module
  alias WaspVM.ModuleInstance
  @moduledoc """
    The store represents all global state that can be manipulated
    by WebAssembly programs. It consists of the runtime representation
    of all instances of functions, tables, memories, and globals that
    have been allocated during the life time of the abstract machine.
  """

  defstruct funcs: [],
            mems: [],
            globals: [],
            tables: []

  @spec allocate_memory(Store, Memory) :: {:ok, integer, Store}
  def allocate_memory(store, memory) do
    index = length(store.mems)
    mems = List.insert_at(store.mems, index, memory)

    {:ok, index, Map.put(store, :mems, mems)}
  end

  def allocate_func(store, func) do
    index = length(store.funcs)
    funcs = List.insert_at(store.funcs, index, func)

    {:ok, index, Map.put(store, :funcs, funcs)}
  end
end