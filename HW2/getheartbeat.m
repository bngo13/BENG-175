function heartbeat = getheartbeat(data)
    heartbeats = findpeaks(data, "MinPeakProminence", 0.5);
    heartbeat = size(heartbeats, 2);
end