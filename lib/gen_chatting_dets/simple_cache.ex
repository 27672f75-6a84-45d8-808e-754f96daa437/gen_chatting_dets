defmodule GenChattingDets.SimpleCache do
  use GenServer

  def start_link(_init_arg) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(init_arg) do
    :file.delete("chatting_room")
    :dets.open_file(:chatting_room, type: :set)
    {:ok, init_arg}
  end

  def get(room_name) do
    GenServer.call(__MODULE__, {:get, room_name})
  end

  def set(room_name, client_list) do
    GenServer.cast(__MODULE__, {:set, room_name, client_list})
  end

  @impl true
  def handle_call({:get, room_name}, _from, state) do
    client_list = :dets.match(:chatting_room, {room_name, :"$1"})
    {:reply, client_list, state}
  end

  @impl true
  def handle_cast({:set, room_name, client_list}, state) do
    :dets.insert(:chatting_room, {room_name, client_list})
    {:noreply, state}
  end

  @impl true
  def handle_info(_message, state) do
    :file.delete("chatting_room")
    :dets.close(:chatting_room)
    {:noreply,state}
  end

  @impl true
  def terminate(_reason, _state) do
    :file.delete("chatting_room")
    :dets.close(:chatting_room)
  end
end
