function heartbeat = getheartbeat(data, prom_val)
    heartbeats = findpeaks(data, "MinPeakProminence", prom_val);
    heartbeat = size(heartbeats, 2);
end