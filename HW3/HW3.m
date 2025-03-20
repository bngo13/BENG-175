function HW3
    load ECG_1.mat ECG Fs;
    sample_count = size(ECG, 1);

    for i = 1:sample_count
        fprintf("Analyzing Sample %d\n", i);
        parseSamples(ECG(i,:), Fs)
        fprintf("Press any key to continue\n");
        pause;
        fprintf("\n");
    end
end

function parseSamples(dataset, Fs)
    locations = findPeaks(dataset, 0.5, Fs);
    rrIntervals = diff(locations);
    fprintf("Average RR Interval: %d\n", mean(rrIntervals));
    histogram(rrIntervals, 25);
end

function locations = findPeaks(data, promVal, Fs)
    [~, locations] = findpeaks(data, "MinPeakProminence", promVal);
    locations = locations / Fs;
end