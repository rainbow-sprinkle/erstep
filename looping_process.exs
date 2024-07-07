# Define a process that loops and handles messages
defmodule LoopingProcess do
  def start do
    spawn(fn -> loop() end)  # Spawns a new process running `loop/0` and returns its PID
  end

  def loop do
    receive do
      {:ping, sender} ->  # Waits for a `{:ping, sender}` message
        send(sender, :pong)  # Sends a `:pong` message back to the sender
        loop()  # Calls `loop()` recursively to continue receiving messages
    after
      5000 ->  # Timeout after 5 seconds of no messages
        IO.puts "No messages received in the last 5 seconds"
        loop()  # Calls `loop()` recursively to continue receiving messages
    end
  end
end

# Start the looping process
pid = LoopingProcess.start()  # The main process starts the looping process and gets its PID

# Send a message to the looping process and wait for a response
send(pid, {:ping, self()})  # The main process sends a `{:ping, self()}` message to the looping process

# The main process waits for a `:pong` response
receive do
  :pong ->
    IO.puts "Received pong from looping process"
after
  1000 ->
    IO.puts "No pong received within 1 second"
end
