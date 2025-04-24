function filtered_data = filterdata(ECG_data, Fs)
    % BP Filter
    fValues = [0.05 150] / Fs / 2;
    b = fir1(42, fValues, "bandpass");
    bp_ECG = filter(b, 1, ECG_data);

    % D/DT
    diff_ECG = diff(bp_ECG);
    
    % ||
    abs_ECG = abs(diff_ECG);

    % LP Filter
    lpVal = 150 / Fs;
    b = fir1(48, lpVal, "low", chebwin(49, 30));
    lp_ECG = filter(b, 1, abs_ECG);
    lp_ECG = movmean(lp_ECG, 10);
    filtered_data = lp_ECG;
end
