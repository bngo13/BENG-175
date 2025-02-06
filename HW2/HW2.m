function [] = HW2()
    % Read Data
    load ECG_1.mat ECG Fs;

    for i = 1:12
        % Plot for each patient
        fprintf("Patient %d\n", i);
        patient_ECG = ECG(i, :);
        plot(patient_ECG)
        
        % Calculate heart rate of patient every minute
        samples_per_min = Fs * 60;
        current_sample = 1;

        while current_sample < 96000
            patient_hr_minute = patient_ECG(current_sample : current_sample + samples_per_min);
            hr = getheartbeat(patient_hr_minute);
            fprintf("Patient heartrate at %d minute(s): %d\n", fix(current_sample / samples_per_min) + 1, hr);
            current_sample = current_sample + samples_per_min;
        end

        fprintf("Press any key to continue...\n")
        pause
    end
end