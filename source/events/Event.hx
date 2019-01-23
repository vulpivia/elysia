package events;

import commands.CommandQueue;

class Event
{
    private var queue:CommandQueue;

    public function run() {
        if (queue != null) {
            queue.run();
        }
    }
}