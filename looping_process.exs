# Define a process that loops and handles messages
defmodule LoopingProcess do
  def start do
    spawn(fn -> loop() end)
  end

  def loop do
    receive do
      {:ping, sender} ->
        send(sender, :pong)
        loop()
    after
      5000 ->
        IO.puts "No messages received in the last 5 seconds"
        loop()
    end
  end
end

# Start the looping process
pid = LoopingProcess.start()

# Send a message to the looping process and wait for a response
send(pid, {:ping, self()})

receive do
  :pong ->
    IO.puts "Received pong from looping process"
after
  0.5 ->
    IO.puts "No pong received within 1 second"
end
