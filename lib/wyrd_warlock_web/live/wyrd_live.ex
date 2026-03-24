defmodule WyrdWarlockWeb.WyrdLive do
  use WyrdWarlockWeb, :live_view
  def mount(_params, _session, socket) do
    {:ok, assign(socket, wyrd_text: "The threads of fate are trembling...", brain_intensity: 0, status: "Awaiting BCI signal...")}
  end
  def handle_event("cast", %{"intent" => intent}, socket) do
    intensity = String.length(intent) * 13 + :rand.uniform(200)
    new_text = "✦ WYR D CAST ✦\n#{String.upcase(intent)}\nIntensity: #{intensity} BCI pulses"
    WyrdWarlock.cast(intent)
    {:noreply, assign(socket, wyrd_text: new_text, brain_intensity: intensity, status: "Sigil successfully weaved.")}
  end
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-black text-green-400 font-mono p-8 flex flex-col items-center justify-center">
      <h1 class="text-5xl mb-8 tracking-widest">🜁 WYRD WARLOCK LIVE 🜁</h1>
      <p class="mb-6 text-xl">BCI EEG Status: <span class="text-yellow-400 font-bold"><%= @status %></span></p>
      <form phx-submit="cast" class="w-full max-w-lg mb-12">
        <input type="text" name="intent" placeholder="Speak your intent into the void..." class="bg-zinc-900 border-2 border-green-500 p-6 w-full text-white text-2xl placeholder:text-zinc-600 focus:outline-none" />
        <button type="submit" class="mt-6 bg-green-600 hover:bg-green-500 px-10 py-4 text-xl w-full font-bold">CAST SPELL INTO THE MATRIX</button>
      </form>
      <pre class="bg-zinc-950 border border-amber-300 p-8 text-amber-300 whitespace-pre-wrap text-lg max-w-2xl"><%= @wyrd_text %></pre>
      <p class="mt-12 text-xs opacity-50">Powered by BCI EEG raw thought leakage • Weird = Wyrd</p>
    </div>
    """
  end
end
