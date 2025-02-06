function heartbeat = getheartbeat(data)
    heartbeats = findpeaks(data, "MinPeakProminence", 1);
    heartbeat = size(heartbeats, 2);
end