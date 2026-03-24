defmodule WyrdWarlock do
  use GenServer
  def start_link(name \\ "Anonymous_Warlock") do
    GenServer.start_link(__MODULE__, name, name: via_tuple(name))
  end
  defp via_tuple(name), do: {:via, Registry, {WyrdRegistry, name}}
  def cast(incantation) do
    pid = case Registry.lookup(WyrdRegistry, "BCI_Warlock") do
      [{pid, _}] -> pid
      _ -> elem(WyrdWarlock.start_link("BCI_Warlock"), 1)
    end
    GenServer.cast(pid, {:weave_wyrd, incantation})
  end
  def init(name) do
    {:ok, %{name: name, mana: 666, last_cast: nil}}
  end
  def handle_cast({:weave_wyrd, spell}, state) do
    IO.puts("🧠 [BCI] #{state.name} received raw brain signal: #{spell}")
    for i <- 1..3 do
      spawn(fn ->
        Process.sleep(:rand.uniform(420))
        IO.puts("   ↳ Familiar #{i} echoes: #{String.reverse(spell) |> String.upcase()}")
      end)
    end
    {:noreply, %{state | last_cast: DateTime.utc_now()}}
  end
end
