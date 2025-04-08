function HW4
    % Data Init
    load ECG_1.mat ECG Fs
    ECG_data = ECG(1, :);
    viewWindow = Fs * 10;

    % ECG
    subplot(6, 1, 1);
    plot(ECG_data(1:viewWindow))
    title("Original ECG")

    % BP Filter
    fValues = [0.05 150] / Fs;
    b = fir1(42, fValues, "bandpass");
    bp_ECG = filter(b, 1, ECG_data);
    subplot(6, 1, 2);
    plot(bp_ECG(1:viewWindow))
    title("BandPass ECG")

    % D/DT
    diff_ECG = diff(bp_ECG);
    subplot(6, 1, 3);
    plot(diff_ECG(1:viewWindow))
    title("D/DT ECG")
    
    % ||
    abs_ECG = abs(diff_ECG);
    subplot(6, 1, 4);
    plot(abs_ECG(1:viewWindow))
    title("ABS ECG")

    % LP Filter
    lpVal = 150 / Fs;
    b = fir1(48, lpVal, "low");
    lp_ECG = filter(b, 1, abs_ECG);
    subplot(6, 1, 5);
    plot(lp_ECG(1:viewWindow))
    title("LowPass ECG")

    % Threshold
end